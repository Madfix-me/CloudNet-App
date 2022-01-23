import 'package:cloudnet/apis/api_service.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/process_configuration.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/service_task.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/service_template.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/service_version.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/service_version_type.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/template_install.dart';
import 'package:cloudnet/state/actions/node_actions.dart';
import 'package:async_redux/async_redux.dart';
import 'package:cloudnet/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import '/utils/color.dart' as color;
import 'package:cloudnet/i18n/strings.g.dart';

class TaskSetupPage extends StatefulWidget {
  const TaskSetupPage({Key? key}) : super(key: key);

  static const String route = '/task-setup';
  static const String name = 'task-setup';

  @override
  _TaskSetupPageState createState() => _TaskSetupPageState();
}

class _TaskSetupPageState extends State<TaskSetupPage> {
  int _index = 0;
  ServiceVersionType serviceVersionType =
      const ServiceVersionType(environmentType: 'MINECRAFT_SERVER');
  ServiceVersion? selectedServiceVersion;

  bool _maintenance = false;
  bool _autoDelete = true;
  bool _staticService = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _memoryController =
      TextEditingController.fromValue(const TextEditingValue(text: '512'));
  final TextEditingController _serviceCountController =
      TextEditingController.fromValue(const TextEditingValue(text: '1'));
  final TextEditingController _startPortController =
      TextEditingController.fromValue(const TextEditingValue(text: '44955'));
  final TextEditingController _javaExecutableController =
      TextEditingController.fromValue(const TextEditingValue(text: 'java'));
  final TextEditingController _splitterController =
      TextEditingController.fromValue(const TextEditingValue(text: '-'));

  final _nameFormKey = GlobalKey<FormState>();
  final _memoryFormKey = GlobalKey<FormState>();
  final _maintenanceFormKey = GlobalKey<FormState>();
  final _autoDeleteFormKey = GlobalKey<FormState>();
  final _staticServiceFormKey = GlobalKey<FormState>();
  final _serviceCountFormKey = GlobalKey<FormState>();
  final _taskEnvironmentFormKey = GlobalKey<FormState>();
  final _startPortFormKey = GlobalKey<FormState>();
  final _javaExecutableFormKey = GlobalKey<FormState>();
  final _serviceVersionFormKey = GlobalKey<FormState>();
  final _splitterFormKey = GlobalKey<FormState>();

  Step buildServiceVersionStep(List<ServiceVersionType> versions) {
    final versionValues = buildVersions(versions, serviceVersionType);
    return Step(
      title: Text(t.page.tasks.setup.service_version),
      content: Form(
        key: _serviceVersionFormKey,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Text(t.page.tasks.setup.question.service_version),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: DropdownButtonFormField<String>(
                  validator: ValidationBuilder().required().build(),
                  value: versionValues?.first.value,
                  items: versionValues,
                  onChanged: (String? value) {
                    final values = value?.split('-');
                    final env = values?[0];
                    final version = values?[1];
                    setState(() {
                      selectedServiceVersion = versions
                          .firstWhere((element) =>
                              element.environmentType ==
                                  serviceVersionType.environmentType &&
                              element.name == env)
                          .versions
                          ?.firstWhere((element) => element.name == version);
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
      state: getStepState(9, _serviceVersionFormKey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<ServiceVersionType>>(
      onInit: (store) {
        store.dispatch(InitMetaInformation());
      },
      converter: (store) => store.state.nodeState.node?.versions ?? List.empty(),
      builder: (context, versions) {
        final steps = <Step>[
          buildTaskNameStep(),
          buildTaskMemoryStep(),
          buildTaskMaintenanceStep(),
          buildAutoDeleteStep(),
          buildStaticServiceStep(),
          buildServiceCountStep(),
          buildEnvironmentStep(versions),
          buildStartPortStep(),
          buildJavaExecutableStep(),
          buildServiceVersionStep(versions),
          buildSplitterStep()
        ];
        return Column(
          children: [
            Expanded(
              child: Stepper(
                currentStep: _index,
                onStepCancel: () {
                  if (_index > 0) {
                    setState(() {
                      _index -= 1;
                    });
                  } else if (_index == 0) {
                    context.pop();
                  }
                },
                onStepContinue: () {
                  if (_index <= 0) {
                    setState(() {
                      _index += 1;
                    });
                  } else if (_index >= 0 && _index <= steps.length) {
                    setState(() {
                      _index += 1;
                    });
                  }
                },
                onStepTapped: (int index) {
                  setState(() {
                    _index = index;
                  });
                },
                controlsBuilder: (context, details) {
                  return Row(
                    children: [
                      Container(
                        child: TextButton(
                          onPressed: () {
                            if (_index == (steps.length - 1)) {
                              bool valid =
                                  _nameFormKey.currentState!.validate() &&
                                      _memoryFormKey.currentState!.validate() &&
                                      _maintenanceFormKey.currentState!
                                          .validate() &&
                                      _autoDeleteFormKey.currentState!
                                          .validate() &&
                                      _staticServiceFormKey.currentState!
                                          .validate() &&
                                      _serviceCountFormKey.currentState!
                                          .validate() &&
                                      _taskEnvironmentFormKey.currentState!
                                          .validate() &&
                                      _startPortFormKey.currentState!
                                          .validate() &&
                                      _javaExecutableFormKey.currentState!
                                          .validate() &&
                                      _serviceVersionFormKey.currentState!
                                          .validate() &&
                                      _splitterFormKey.currentState!.validate();
                              if (valid) {
                                final api = ApiService();
                                final name = _nameController.text;
                                final install = TemplateInstall(
                                    force: false,
                                    serviceVersionType: serviceVersionType,
                                    serviceVersion: selectedServiceVersion);
                                ServiceTask task = ServiceTask(
                                  templates: List.empty(growable: true),
                                  deployments: List.empty(growable: true),
                                  name: _nameController.text,
                                  javaCommand: _javaExecutableController.text,
                                  maintenance: _maintenance,
                                  minServiceCount: int.tryParse(
                                      _serviceCountController.text),
                                  staticServices: _staticService,
                                  autoDeleteOnStop: _autoDelete,
                                  startPort:
                                      int.tryParse(_startPortController.text),
                                  processConfiguration: ProcessConfiguration(
                                    environment:
                                        serviceVersionType.environmentType,
                                    maxHeapMemorySize:
                                        int.tryParse(_memoryController.text),
                                    jvmOptions: List.empty(),
                                    processParameters: List.empty(),
                                  ),
                                );
                                api.templateStorageApi.getStorage().then(
                                  (storageApi) {
                                    for (var storage in storageApi.storages) {
                                      api.templateApi
                                          .create(storage, name, 'default')
                                          .then(
                                        (successTemp) {
                                          final templates = task.templates;
                                          templates?.add(
                                            ServiceTemplate(
                                                alwaysCopyToStaticServices:
                                                    false,
                                                name: 'default',
                                                prefix: name,
                                                storage: storage),
                                          );
                                          task.copyWith(templates: templates);
                                          api.templateApi
                                              .install(install, storage, name,
                                                  'default')
                                              .then(
                                            (successInstall) {
                                              SnackBar snackBar = SnackBar(
                                                content: Text(t
                                                    .page.tasks.setup.snackbar
                                                    .template(
                                                        storage: storage,
                                                        name: name)),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            },
                                          );
                                        },
                                      );
                                    }
                                  },
                                );

                                ApiService()
                                    .tasksApi
                                    .createTask(task)
                                    .then((value) {
                                  StoreProvider.dispatch(
                                      context, UpdateTasks());
                                  context.pop();
                                });
                              }
                            } else {
                              if (isValid(_index)) {
                                details.onStepContinue!();
                              }
                            }
                          },
                          child: _index == (steps.length - 1)
                              ? Text(t.general.button.finish)
                              : Text(t.general.button.bcontinue),
                        ),
                        margin: const EdgeInsets.all(4.0),
                      ),
                      Container(
                        child: TextButton(
                          onPressed: details.onStepCancel,
                          child: _index == 0
                              ? Text(t.general.button.cancel)
                              : Text(t.general.button.previous),
                          style:
                              TextButton.styleFrom(backgroundColor: color.gray),
                        ),
                        margin: const EdgeInsets.all(4.0),
                      )
                    ],
                  );
                },
                steps: steps,
              ),
            )
          ],
        );
      },
    );
  }

  Step buildJavaExecutableStep() {
    return Step(
      title: Text(t.page.tasks.setup.java_executable),
      content: Form(
        key: _javaExecutableFormKey,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Text(t.page.tasks.setup.question.java_executable),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  validator: ValidationBuilder().required().build(),
                  controller: _javaExecutableController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: t.page.tasks.setup.path,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      state: getStepState(8, _javaExecutableFormKey),
    );
  }

  Step buildStartPortStep() {
    return Step(
      title: Text(t.page.tasks.setup.start_port),
      content: Form(
        key: _startPortFormKey,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Text(t.page.tasks.setup.question.start_port),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  validator: ValidationBuilder().required().build(),
                  controller: _startPortController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: t.page.tasks.setup.start_port,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      state: getStepState(7, _startPortFormKey),
    );
  }

  Step buildEnvironmentStep(List<ServiceVersionType> versions) {
    final versionsValues = buildEnvironments(versions);
    return Step(
      title: Text(t.page.tasks.setup.task_environment),
      content: Form(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Text(t.page.tasks.setup.question.task_environment),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: DropdownButtonFormField<String>(
                  validator: ValidationBuilder().required().build(),
                  value: versionsValues?.first.value,
                  items: versionsValues,
                  onChanged: (String? value) {
                    serviceVersionType = versions.firstWhere((element) =>
                        (element.environmentType ?? '') == (value ?? ''));
                  },
                ),
              )
            ],
          ),
        ),
        key: _taskEnvironmentFormKey,
      ),
      state: getStepState(6, _taskEnvironmentFormKey),
    );
  }

  Step buildServiceCountStep() {
    return Step(
      title: Text(t.page.tasks.setup.service_count),
      content: Form(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Text(t.page.tasks.setup.question.service_count),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  validator: ValidationBuilder().required().build(),
                  controller: _serviceCountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: t.page.tasks.setup.service_count,
                  ),
                ),
              )
            ],
          ),
        ),
        key: _serviceCountFormKey,
      ),
      state: getStepState(5, _serviceCountFormKey),
    );
  }

  Step buildTaskNameStep() {
    return Step(
      title: Text(t.page.tasks.setup.task_name),
      content: Form(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Text(t.page.tasks.setup.question.task_name),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  validator: ValidationBuilder().required().build(),
                  decoration: InputDecoration(
                    labelText: t.page.tasks.setup.task_name,
                  ),
                ),
              )
            ],
          ),
        ),
        key: _nameFormKey,
      ),
      state: getStepState(0, _nameFormKey),
    );
  }

  Step buildTaskMemoryStep() {
    return Step(
      title: Text(t.page.tasks.setup.memory),
      content: Form(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Text(t.page.tasks.setup.question.memory),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  controller: _memoryController,
                  validator: ValidationBuilder().required().build(),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: t.page.tasks.setup.memory,
                  ),
                ),
              )
            ],
          ),
        ),
        key: _memoryFormKey,
      ),
      state: getStepState(1, _memoryFormKey),
    );
  }

  Step buildTaskMaintenanceStep() {
    return Step(
        title: Text(t.page.tasks.setup.maintenance_default),
        content: Form(
          key: _maintenanceFormKey,
          child: Column(
            children: [
              Text(t.page.tasks.setup.question.maintenance_default),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: Switch(
                  value: _maintenance,
                  onChanged: (value) {
                    setState(() {
                      _maintenance = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        state: getStepState(2, _maintenanceFormKey));
  }

  Step buildAutoDeleteStep() {
    return Step(
        title: Text(t.page.tasks.setup.auto_delete),
        content: Form(
          key: _autoDeleteFormKey,
          child: Column(
            children: [
              Text(t.page.tasks.setup.question.auto_delete),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: Switch(
                  value: _autoDelete,
                  onChanged: (value) {
                    setState(() {
                      _autoDelete = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        state: getStepState(3, _autoDeleteFormKey));
  }

  Step buildStaticServiceStep() {
    return Step(
        title: Text(t.page.tasks.setup.static_service),
        content: Form(
          key: _staticServiceFormKey,
          child: Column(
            children: [
              Text(t.page.tasks.setup.question.static_service),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: Switch(
                  value: _staticService,
                  onChanged: (value) {
                    setState(() {
                      _staticService = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        state: getStepState(3, _staticServiceFormKey));
  }

  Step buildSplitterStep() {
    return Step(
      title: Text(t.page.tasks.setup.splitter),
      content: Form(
        key: _splitterFormKey,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Text(t.page.tasks.setup.question.splitter),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  validator: ValidationBuilder().required().build(),
                  controller: _splitterController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: t.page.tasks.setup.splitter,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      state: getStepState(10, _splitterFormKey),
    );
  }

  List<DropdownMenuItem<String>>? buildEnvironments(
      List<ServiceVersionType> versions) {
    return versions.isNotEmpty
        ? versions.map((e) => e.environmentType ?? '').toSet().toList().map(
            (e) {
              return DropdownMenuItem<String>(
                child: Text(e),
                value: e,
              );
            },
          ).toList()
        : null;
  }

  List<DropdownMenuItem<String>>? buildVersions(
      List<ServiceVersionType> versions, ServiceVersionType versionType) {
    List<String> vers = List.empty(growable: true);
    for (var type in versions.where((element) =>
        (element.environmentType ?? '') ==
        (versionType.environmentType ?? ''))) {
      for (var element in type.versions!) {
        vers.add('${type.name}-${element.name}');
      }
    }
    return vers.isNotEmpty
        ? vers.map(
            (e) {
              return DropdownMenuItem<String>(
                child: Text(e),
                value: e,
              );
            },
          ).toList()
        : null;
  }

  StepState getStepState(int i, GlobalKey<FormState> form) {
    if (_index == i) {
      return StepState.editing;
    }
    if (_index > i) {
      if (form.currentState!.validate()) {
        return StepState.complete;
      } else {
        return StepState.error;
      }
    }
    return StepState.disabled;
  }

  bool isValid(int index) {
    switch (index) {
      case 0:
        return _nameFormKey.currentState!.validate();
      case 1:
        return _memoryFormKey.currentState!.validate();
      case 2:
        return _maintenanceFormKey.currentState!.validate();
      case 3:
        return _autoDeleteFormKey.currentState!.validate();
      case 4:
        return _staticServiceFormKey.currentState!.validate();
      case 5:
        return _serviceCountFormKey.currentState!.validate();
      case 6:
        return _taskEnvironmentFormKey.currentState!.validate();
      case 7:
        return _startPortFormKey.currentState!.validate();
      case 8:
        return _javaExecutableFormKey.currentState!.validate();
      case 9:
        return _serviceVersionFormKey.currentState!.validate();
      case 10:
        return _splitterFormKey.currentState!.validate();
      default:
        return false;
    }
  }
}
