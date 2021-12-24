import 'package:CloudNet/apis/cloudnetv3spec/model/service_version.dart';
import 'package:CloudNet/apis/cloudnetv3spec/model/service_version_type.dart';
import 'package:CloudNet/state/actions/app_actions.dart';
import 'package:CloudNet/state/app_state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import '/utils/color.dart' as color;

class TaskSetupPage extends StatefulWidget {
  const TaskSetupPage({Key? key}) : super(key: key);

  static const String route = '/task-setup';
  static const String name = 'task-setup';

  @override
  _TaskSetupPageState createState() => _TaskSetupPageState();
}

class _TaskSetupPageState extends State<TaskSetupPage> {
  int _index = 0;
  ServiceVersionType? serviceVersionType;
  ServiceVersion? selectedServiceVersion;

  bool _maintenance = false;
  bool _autoDelete = false;
  bool _staticService = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _memoryController = TextEditingController.fromValue(const TextEditingValue(text: '512'));
  final TextEditingController _serviceCountController = TextEditingController.fromValue(const TextEditingValue(text: '1'));
  final TextEditingController _startPortController = TextEditingController.fromValue(const TextEditingValue(text: '44955'));
  final TextEditingController _javaExecutableController = TextEditingController.fromValue(const TextEditingValue(text: 'java'));
  final TextEditingController _splitterController = TextEditingController.fromValue(const TextEditingValue(text: '-'));

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

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<ServiceVersionType>>(
      onInit: (store) {
        store.dispatch(InitAppStateAction());
      },
      converter: (store) => store.state.versions ?? List.empty(),
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
                            } else {
                              if (isValid(_index)) {
                                details.onStepContinue!();
                              }
                            }
                          },
                          child: _index == (steps.length - 1)
                              ? const Text('FINISH')
                              : const Text('CONTINUE'),
                        ),
                        margin: const EdgeInsets.all(4.0),
                      ),
                      Container(
                        child: TextButton(
                          onPressed: details.onStepCancel,
                          child: _index == 0
                              ? const Text('CANCEL')
                              : const Text('PREVIOUS'),
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

  Step buildServiceVersionStep(List<ServiceVersionType> versions) {
    final versionValues = buildVersions(
        versions,
        serviceVersionType ??
            const ServiceVersionType(environmentType: 'MINECRAFT_SERVER'));
    return Step(
      title: const Text('Service Version'),
      content: Form(
        key: _serviceVersionFormKey,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              const Text(
                  'Which ServiceVersion should be ran on services of this task?'),
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
                          .firstWhere(
                              (element) => element.environmentType == env)
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

  Step buildJavaExecutableStep() {
    return Step(
      title: const Text('Java executable'),
      content: Form(
        key: _javaExecutableFormKey,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              const Text('What is the path to the Java executable?'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  validator: ValidationBuilder().required().build(),
                  controller: _javaExecutableController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Path',
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
      title: const Text('Start Port'),
      content: Form(
        key: _startPortFormKey,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              const Text('What should be the start port of the task?'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  validator: ValidationBuilder().required().build(),
                  controller: _startPortController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Start Port',
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
      title: const Text('Task Environment'),
      content: Form(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              const Text('What should be the environment of this task? '),
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
      title: const Text('Service Count'),
      content: Form(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              const Text(
                  'How many services of this task should be always online?'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  validator: ValidationBuilder().required().build(),
                  controller: _serviceCountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Service Count',
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

  Step buildStaticServiceStep() {
    return Step(
        title: const Text('Static Service'),
        content: Form(
          key: _staticServiceFormKey,
          child: Column(
            children: [
              const Text(
                  'Should the services of this task be static that their files are never deleted'),
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

  Step buildAutoDeleteStep() {
    return Step(
        title: const Text('Auto delete'),
        content: Form(
          key: _autoDeleteFormKey,
          child: Column(
            children: [
              const Text(
                  'Should the services be automatically unregistered out of the cloud after stopping them?'),
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

  Step buildTaskNameStep() {
    return Step(
      title: const Text('Task Name'),
      content: Form(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              const Text('What should the name of the new task be?'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  validator: ValidationBuilder().required().build(),
                  decoration: const InputDecoration(
                    labelText: 'Task name',
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

  Step buildSplitterStep() {
    return Step(
      title: const Text('Splitter'),
      content: Form(
        key: _splitterFormKey,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              const Text('What should the splitter of the new task be?'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  validator: ValidationBuilder().required().build(),
                  controller: _splitterController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: 'Splitter',
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

  Step buildTaskMemoryStep() {
    return Step(
      title: const Text('Memory'),
      content: Form(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              const Text(
                  'What amount of max memory should the new task have? (in MB)'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  controller: _memoryController,
                  validator: ValidationBuilder().required().build(),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Memory',
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
        title: const Text('Maintenance default'),
        content: Form(
          key: _maintenanceFormKey,
          child: Column(
            children: [
              const Text(
                  'Should the task be in maintenance by default? (this prevents auto starting of the services)'),
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
      case 0: return _nameFormKey.currentState!.validate();
      case 1: return _memoryFormKey.currentState!.validate();
      case 2: return _maintenanceFormKey.currentState!.validate();
      case 3: return _autoDeleteFormKey.currentState!.validate();
      case 4: return _staticServiceFormKey.currentState!.validate();
      case 5: return _serviceCountFormKey.currentState!.validate();
      case 6: return _taskEnvironmentFormKey.currentState!.validate();
      case 7: return _startPortFormKey.currentState!.validate();
      case 8: return _javaExecutableFormKey.currentState!.validate();
      case 9: return _serviceVersionFormKey.currentState!.validate();
      case 10: return _splitterFormKey.currentState!.validate();
      default: return false;
    }
  }
}
