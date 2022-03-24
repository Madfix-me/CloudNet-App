import 'package:async_redux/async_redux.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_task.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/smart_config.dart';
import 'package:cloudnet/i18n/strings.g.dart';
import 'package:cloudnet/state/actions/node_actions.dart';
import 'package:cloudnet/state/app_state.dart';
import 'package:cloudnet/state/node_state.dart';
import 'package:cloudnet/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import '../../apis/cloudnetv3spec/model/cloudnet/service_deployment.dart';
import '../../apis/cloudnetv3spec/model/cloudnet/service_remote_inclusion.dart';

class EditTaskPage extends StatefulWidget {
  const EditTaskPage({required this.task, Key? key}) : super(key: key);
  final ServiceTask task;

  static const String route = 'task-edit';
  static const String name = 'task-edit';

  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  final _formKey = GlobalKey<FormState>();
  late ServiceTask task;
  late ServiceTask editTask;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _splitterController = TextEditingController();
  final TextEditingController _javaCommandController = TextEditingController();
  final TextEditingController _environmentCommandController =
      TextEditingController();
  final TextEditingController _portController = TextEditingController();
  final TextEditingController _minServiceController = TextEditingController();
  final TextEditingController _maxHeapController = TextEditingController();

  TextEditingController? _smartConfigPriority;
  TextEditingController? _smartConfigMaxServices;
  TextEditingController? _smartConfigPreparedServices;
  TextEditingController? _smartConfigSmartMinServiceCount;
  TextEditingController? _smartConfigAutoStopTimeByUnusedServiceInSeconds;
  TextEditingController?
      _smartConfigPercentOfPlayersToCheckShouldStopTheService;
  TextEditingController? _smartConfigForAnewInstanceDelayTimeInSeconds;
  TextEditingController? _smartConfigPercentOfPlayersForANewServiceByInstance;
  SmartConfig? _config;

  String? requiredPermission;
  TextEditingController? _requiredPermissionPermission;

  @override
  void initState() {
    task = widget.task;
    editTask = widget.task;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ServiceTask task = widget.task;
    _nameController.text = task.name ?? '';
    _splitterController.text = task.nameSplitter ?? '';
    _portController.text = task.startPort?.toString() ?? '';
    _environmentCommandController.text =
        task.processConfiguration?.environment?.toString() ?? '';
    _javaCommandController.text = task.javaCommand.toString();
    _minServiceController.text = task.minServiceCount?.toString() ?? '';
    _maxHeapController.text =
        task.processConfiguration?.maxHeapMemorySize?.toString() ?? '';
    if (task.properties.containsKey('smartConfig')) {
      _config = SmartConfig.fromJson(
          task.properties['smartConfig'] as Map<String, dynamic>);
      _smartConfigPriority = TextEditingController.fromValue(
          TextEditingValue(text: _config?.priority.toString() ?? ''));
      _smartConfigMaxServices = TextEditingController.fromValue(
          TextEditingValue(text: _config?.maxServices.toString() ?? ''));
      _smartConfigPreparedServices = TextEditingController.fromValue(
          TextEditingValue(text: _config?.preparedServices.toString() ?? ''));
      _smartConfigSmartMinServiceCount = TextEditingController.fromValue(
          TextEditingValue(
              text: _config?.smartMinServiceCount.toString() ?? ''));
      _smartConfigAutoStopTimeByUnusedServiceInSeconds =
          TextEditingController.fromValue(TextEditingValue(
              text: _config?.autoStopTimeByUnusedServiceInSeconds.toString() ??
                  ''));
      _smartConfigPercentOfPlayersToCheckShouldStopTheService =
          TextEditingController.fromValue(TextEditingValue(
              text: _config?.percentOfPlayersToCheckShouldStopTheService
                      .toString() ??
                  ''));
      _smartConfigForAnewInstanceDelayTimeInSeconds =
          TextEditingController.fromValue(TextEditingValue(
              text:
                  _config?.forAnewInstanceDelayTimeInSeconds.toString() ?? ''));
      _smartConfigPercentOfPlayersForANewServiceByInstance =
          TextEditingController.fromValue(TextEditingValue(
              text: _config?.percentOfPlayersForANewServiceByInstance
                      .toString() ??
                  ''));
    }
    if (task.properties.containsKey('requiredPermission')) {
      requiredPermission = task.properties['requiredPermission'] as String?;
      print(requiredPermission);
      _requiredPermissionPermission = TextEditingController.fromValue(
          TextEditingValue(text: requiredPermission ?? ''));
    }

    return StoreConnector<AppState, NodeState>(
      converter: (store) => store.state.nodeState,
      builder: (context, vm) {
        return Stack(children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        ExpansionTile(
                          title: Text(t.page.tasks.edit.basic_configuration,
                              style: Theme.of(context).textTheme.headline5),
                          childrenPadding:
                              EdgeInsets.only(left: 16.0, right: 16.0),
                          children: [
                            _buildName(), // X
                            _buildSplitter(), // X
                            _buildJavaCommand(), // -
                            _buildEnvironment(vm), // WIP
                            _buildPort(), // X
                            _buildMinServiceCount(), // X
                            _buildMaxHeap(), // X
                            _buildMaintenance(), // X
                            _buildStatic(), // X
                            /*Divider(),
                            _buildTemplates(vm),*/
                            Divider(),
                            _buildJvmOptions(vm), // X
                            Divider(),
                            _buildGroups(vm), // X
                            Divider(),
                            _buildProcessParameter(vm), // X
                            Divider(),
                            _buildNodes(vm), // X
                            Divider(),
                            _buildDeployments(vm), // X
                            _buildIncludes(vm), // X
                          ],
                        ),
                        _config != null
                            ? ExpansionTile(
                                title: Text(t.page.tasks.edit.smart_config,
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                childrenPadding: const EdgeInsets.only(
                                    left: 16.0, right: 16.0),
                                children: [
                                  _buildSmartEnabled(),
                                  _buildSmartSplitLogicOverNodes(),
                                  _buildSmartDirectTemplateInclusions(),
                                  _buildSmartPriority(),
                                  _buildSmartMaxServices(),
                                  _buildSmartPreparedMaxServices(),
                                  _buildSmartSmartMinServiceCount(),
                                  _buildSmartAutoStopOfUnusedService(),
                                  _buildSmartAutoStopViaPercentage(),
                                  _buildSmartTimeDelayForNewService(),
                                  _buildSmartPercentageForNewService()
                                ],
                              )
                            : Flex(direction: Axis.horizontal),
                        task.properties.containsKey('requiredPermission')
                            ? ExpansionTile(
                                title: Text("Required permission",
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                childrenPadding: const EdgeInsets.only(
                                    left: 16.0, right: 16.0),
                                children: [
                                  _buildRequiredPermission(),
                                ],
                              )
                            : Flex(direction: Axis.horizontal),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            child: FloatingActionButton(
              onPressed: () => _saveTask(),
              child: const Icon(Icons.save_sharp),
            ),
            bottom: 16,
            right: 16,
          )
        ]);
      },
    );
  }

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      editTask = editTask.copyWith(
        startPort: int.tryParse(_portController.value.text),
      );
      editTask = editTask.copyWith(
        processConfiguration: editTask.processConfiguration?.copyWith(
          maxHeapMemorySize: int.tryParse(_maxHeapController.value.text),
        ),
      );

      editTask = editTask.copyWith(
        minServiceCount: int.tryParse(
          _minServiceController.text,
        ),
      );

      editTask = editTask.copyWith(
        nameSplitter: _splitterController.text,
      );
      if (_config != null) {
        var config = _config!.copyWith(
            maxServices: int.tryParse(_smartConfigMaxServices!.text)!,
            priority: int.tryParse(_smartConfigPriority!.text)!,
            preparedServices: int.tryParse(_smartConfigPreparedServices!.text)!,
            smartMinServiceCount:
                int.tryParse(_smartConfigSmartMinServiceCount!.text)!,
            autoStopTimeByUnusedServiceInSeconds: int.tryParse(
                _smartConfigAutoStopTimeByUnusedServiceInSeconds!.text)!,
            percentOfPlayersToCheckShouldStopTheService: int.tryParse(
                _smartConfigPercentOfPlayersToCheckShouldStopTheService!.text)!,
            forAnewInstanceDelayTimeInSeconds: int.tryParse(
                _smartConfigForAnewInstanceDelayTimeInSeconds!.text)!,
            percentOfPlayersForANewServiceByInstance: int.tryParse(
                _smartConfigPercentOfPlayersForANewServiceByInstance!.text)!);
        editTask.properties
            .update("smartConfig", (dynamic value) => config.toJson());
      }

      if (_requiredPermissionPermission != null) {
        requiredPermission = _requiredPermissionPermission!.text;
        editTask.properties.update(
            "requiredPermission", (dynamic value) => '$requiredPermission');
      }

      StoreProvider.dispatch(context, UpdateTask(editTask));
    }
  }

  // Basic Widgets

  Widget _buildName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.name,
            controller: _nameController,
            enabled: false,
            decoration: InputDecoration(labelText: t.general.name),
          ),
        ),
      ],
    );
  }

  Widget _buildSplitter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.name,
            controller: _splitterController,
            decoration: InputDecoration(labelText: "Name Splitter"),
          ),
        ),
      ],
    );
  }

  Widget _buildPort() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: _portController,
            decoration:
                InputDecoration(labelText: t.page.tasks.setup.start_port),
            validator: ValidationBuilder()
                .required(t.page.tasks.edit.required.port)
                .add((e) => _betweenMinAndMax(e, 1, 65565))
                .build(),
          ),
        ),
      ],
    );
  }

  String? _betweenMinAndMax(String? value, int min, int max) {
    if (value != null) {
      if (int.parse(value) >= min && int.parse(value) <= max) {
        return null;
      }
    }
    return t.general.not_valid;
  }

  String? _min(String? value, int min) {
    if (value != null) {
      if (int.parse(value) >= min) {
        return null;
      }
    }
    return t.general.not_valid;
  }

  Widget _buildMinServiceCount() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: _minServiceController,
            decoration: InputDecoration(labelText: t.general.min_service_count),
            validator: ValidationBuilder()
                .required(t.page.tasks.edit.required.min_service)
                .add((e) => _min(e, 0))
                .build(),
          ),
        ),
      ],
    );
  }

  Widget _buildMaxHeap() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: _maxHeapController,
            decoration: InputDecoration(labelText: t.page.tasks.edit.max_heap),
            validator: ValidationBuilder()
                .required(t.page.tasks.edit.required.heap)
                .add((e) => _min(e, 0))
                .build(),
          ),
        )
      ],
    );
  }

  Widget _buildMaintenance() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(t.page.tasks.edit.maintenance),
          ],
        ),
        Column(
          children: [
            Switch(
              value: editTask.maintenance,
              onChanged: (value) {
                setState(() {
                  editTask =
                      editTask.copyWith(maintenance: !editTask.maintenance);
                });
              },
            )
          ],
        )
      ],
    );
  }

  Widget _buildStatic() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(t.page.tasks.edit.static),
          ],
        ),
        Column(
          children: [
            Switch(
              value: editTask.staticServices,
              onChanged: (value) {
                setState(() {
                  editTask = editTask.copyWith(
                      staticServices: !editTask.staticServices);
                });
              },
            )
          ],
        )
      ],
    );
  }

  Widget _buildNodes(NodeState state) {
    return InkWell(
      onTap: () {
        showDialog<AlertDialog>(
          context: context,
          builder: (context) {
            return selectNodes(context, state, editTask, (task) {
              setState(() {
                editTask =
                    editTask.copyWith(associatedNodes: task.associatedNodes);
                Navigator.pop(context);
              });
            });
          },
        );
      },
      child: Container(
        constraints: BoxConstraints(minHeight: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Nodes"),
            Flexible(
              child: Wrap(
                spacing: 8,
                children: editTask.associatedNodes.isNotEmpty
                    ? List<Widget>.generate(
                        editTask.associatedNodes.length,
                        (index) {
                          return Chip(
                            label: Text(widget.task.associatedNodes[index]),
                          );
                        },
                      )
                    : [
                        Chip(
                          label: Text("All"),
                        )
                      ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGroups(NodeState state) {
    return InkWell(
      onTap: () {
        showDialog<AlertDialog>(
          context: context,
          builder: (context) {
            return selectGroups(context, state, editTask, (task) {
              setState(() {
                editTask = editTask.copyWith(groups: task.groups);
                Navigator.pop(context);
              });
            });
          },
        );
      },
      child: Container(
        constraints: BoxConstraints(minHeight: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(t.page.tasks.edit.groups),
            Flexible(
              child: Wrap(
                spacing: 8,
                children: List<Widget>.generate(
                  editTask.groups?.length ?? 0,
                  (index) {
                    return Chip(
                      label: Text(widget.task.groups?[index] ?? ''),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTemplates(NodeState state) {
    return InkWell(
      onTap: () {
        showDialog<AlertDialog>(
          context: context,
          builder: (context) {
            return selectGroups(context, state, editTask, (task) {
              setState(() {
                editTask = editTask.copyWith(groups: task.groups);
                Navigator.pop(context);
              });
            });
          },
        );
      },
      child: Container(
        constraints: BoxConstraints(minHeight: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(t.page.tasks.edit.groups),
            Flexible(
              child: Wrap(
                spacing: 8,
                children: List<Widget>.generate(
                  editTask.groups?.length ?? 0,
                  (index) {
                    return Chip(
                      label: Text(widget.task.groups?[index] ?? ''),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildJvmOptions(NodeState state) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text("Jvm options"),
              ListView(
                shrinkWrap: true,
                children: editTask.processConfiguration!.jvmOptions.isNotEmpty
                    ? List<Widget>.generate(
                        editTask.processConfiguration!.jvmOptions.length + 1,
                        (index) {
                          if (index ==
                              editTask
                                  .processConfiguration!.jvmOptions.length) {
                            return Card(
                              child: ListTile(
                                title: Text("Add jvm option"),
                                leading: Icon(Icons.add),
                                enabled: false,
                                onTap: () {
                                  showDialog<AlertDialog>(
                                    context: context,
                                    builder: (context) {
                                      return addEditString(
                                        context,
                                        state,
                                        false,
                                        null,
                                        (option) {
                                          setState(() {
                                            editTask.processConfiguration!
                                                .jvmOptions
                                                .add(option);
                                            Navigator.pop(context);
                                          });
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          }
                          final jvmOption =
                              editTask.processConfiguration!.jvmOptions[index];
                          return Card(
                            child: ListTile(
                              enabled: false,
                              title: Text(jvmOption),
                              leading: Icon(Icons.storage),
                              trailing: IconButton(
                                color: Theme.of(context).errorColor,
                                icon: Icon(
                                  Icons.delete_forever,
                                ),
                                onPressed:
                                    null /*() {
                                  showDialog<AlertDialog>(
                                    context: context,
                                    builder: (context) {
                                      return deleteDialog(
                                        context,
                                        onCancel: () {
                                          Navigator.pop(context);
                                        },
                                        onDelete: () {
                                          setState(() {
                                            editTask.processConfiguration!
                                                .jvmOptions
                                                .removeAt(index);
                                          });
                                          Navigator.pop(context);
                                        },
                                        item: jvmOption,
                                      );
                                    },
                                  );
                                }*/
                                ,
                              ),
                              onTap: () {
                                showDialog<AlertDialog>(
                                  context: context,
                                  builder: (context) {
                                    return addEditString(
                                        context, state, true, jvmOption,
                                        (option) {
                                      setState(() {
                                        editTask
                                            .processConfiguration!.jvmOptions
                                            .removeAt(index);
                                        editTask
                                            .processConfiguration!.jvmOptions
                                            .add(option);
                                        Navigator.pop(context);
                                      });
                                    });
                                  },
                                );
                              },
                            ),
                          );
                        },
                      )
                    : [
                        Card(
                          child: ListTile(
                            title: Text("No jvm options"),
                            enabled: false,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text("Add jvm option"),
                            enabled: false,
                            leading: Icon(Icons.add),
                            onTap: () {
                              showDialog<AlertDialog>(
                                context: context,
                                builder: (context) {
                                  return addEditString(
                                      context, state, false, null, (option) {
                                    setState(() {
                                      editTask.processConfiguration!.jvmOptions
                                          .add(option);
                                      Navigator.pop(context);
                                    });
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildProcessParameter(NodeState state) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text("Process Parameters"),
              ListView(
                shrinkWrap: true,
                children: editTask
                        .processConfiguration!.processParameters.isNotEmpty
                    ? List<Widget>.generate(
                        editTask.processConfiguration!.processParameters
                                .length +
                            1,
                        (index) {
                          if (index ==
                              editTask.processConfiguration!.processParameters
                                  .length) {
                            return Card(
                              child: ListTile(
                                title: Text("Add process parameter"),
                                leading: Icon(Icons.add),
                                enabled: false,
                                onTap: () {
                                  showDialog<AlertDialog>(
                                    context: context,
                                    builder: (context) {
                                      return addEditString(
                                        context,
                                        state,
                                        false,
                                        null,
                                        (option) {
                                          setState(() {
                                            editTask.processConfiguration!
                                                .processParameters
                                                .add(option);
                                            Navigator.pop(context);
                                          });
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          }
                          final jvmOption = editTask
                              .processConfiguration!.processParameters[index];
                          return Card(
                            child: ListTile(
                              enabled: false,
                              title: Text(jvmOption),
                              leading: Icon(Icons.storage),
                              trailing: IconButton(
                                color: Theme.of(context).errorColor,
                                icon: Icon(
                                  Icons.delete_forever,
                                ),
                                onPressed:
                                    null /*() {
                                  showDialog<AlertDialog>(
                                    context: context,
                                    builder: (context) {
                                      return deleteDialog(
                                        context,
                                        onCancel: () {
                                          Navigator.pop(context);
                                        },
                                        onDelete: () {
                                          setState(() {
                                            editTask.processConfiguration!
                                                .processParameters
                                                .removeAt(index);
                                          });
                                          Navigator.pop(context);
                                        },
                                        item: jvmOption,
                                      );
                                    },
                                  );
                                }*/
                                ,
                              ),
                              onTap: () {
                                showDialog<AlertDialog>(
                                  context: context,
                                  builder: (context) {
                                    return addEditString(
                                        context, state, true, jvmOption,
                                        (option) {
                                      setState(() {
                                        editTask.processConfiguration!
                                            .processParameters
                                            .removeAt(index);
                                        editTask.processConfiguration!
                                            .processParameters
                                            .add(option);
                                        Navigator.pop(context);
                                      });
                                    });
                                  },
                                );
                              },
                            ),
                          );
                        },
                      )
                    : [
                        Card(
                          child: ListTile(
                            title: Text("No process parameter"),
                            enabled: false,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            enabled: false,
                            title: Text("Add process parameter"),
                            leading: Icon(Icons.add),
                            onTap: () {
                              showDialog<AlertDialog>(
                                context: context,
                                builder: (context) {
                                  return addEditString(
                                      context, state, false, null, (option) {
                                    setState(() {
                                      editTask.processConfiguration!
                                          .processParameters
                                          .add(option);
                                      Navigator.pop(context);
                                    });
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildDeployments(NodeState state) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(t.page.tasks.edit.deployments),
              ListView(
                shrinkWrap: true,
                children: widget.task.deployments.isNotEmpty
                    ? List<Widget>.generate(
                        widget.task.deployments.length + 1,
                        (index) {
                          if (index == widget.task.deployments.length) {
                            return Card(
                              child: ListTile(
                                title: Text(t.page.tasks.edit.add_deployment),
                                leading: Icon(Icons.add),
                                enabled: true,
                                onTap: () {
                                  showDialog<AlertDialog>(
                                    context: context,
                                    builder: (context) {
                                      return addEditDeployment(
                                        context,
                                        false,
                                        ServiceDeployment(excludes: []),
                                        state,
                                        (deployment) {
                                          setState(() {
                                            editTask.deployments
                                                .add(deployment);
                                            Navigator.pop(context);
                                          });
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          }
                          final deployment = widget.task.deployments[index];
                          final format =
                              '${deployment.template?.storage}:${deployment.template?.prefix}/${deployment.template?.name}';
                          return Card(
                            child: ListTile(
                              title: Text(format),
                              leading: Icon(Icons.storage),
                              trailing: IconButton(
                                color: Theme.of(context).errorColor,
                                icon: Icon(
                                  Icons.delete_forever,
                                ),
                                onPressed: () {
                                  showDialog<AlertDialog>(
                                    context: context,
                                    builder: (context) {
                                      return deleteDialog(
                                        context,
                                        onCancel: () {
                                          Navigator.pop(context);
                                        },
                                        onDelete: () {
                                          setState(() {
                                            editTask.deployments
                                                .removeAt(index);
                                          });
                                          Navigator.pop(context);
                                        },
                                        item: format,
                                      );
                                    },
                                  );
                                },
                              ),
                              onTap: () {
                                showDialog<AlertDialog>(
                                  context: context,
                                  builder: (context) {
                                    return addEditDeployment(
                                        context, true, deployment, state,
                                        (deployment) {
                                      setState(() {
                                        editTask.deployments.removeAt(index);
                                        editTask.deployments.add(deployment);
                                        Navigator.pop(context);
                                      });
                                    });
                                  },
                                );
                              },
                            ),
                          );
                        },
                      )
                    : [
                        Card(
                          child: ListTile(
                            title: Text(t.page.tasks.edit.no_deployments),
                            enabled: false,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(t.page.tasks.edit.add_deployment),
                            leading: Icon(Icons.add),
                            onTap: () {
                              showDialog<AlertDialog>(
                                context: context,
                                builder: (context) {
                                  return addEditDeployment(
                                      context,
                                      false,
                                      ServiceDeployment(excludes: []),
                                      state, (deployment) {
                                    setState(() {
                                      editTask.deployments.add(deployment);
                                      Navigator.pop(context);
                                    });
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildIncludes(NodeState state) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(t.page.tasks.edit.includes),
              ListView(
                shrinkWrap: true,
                children: widget.task.includes.isNotEmpty
                    ? List<Widget>.generate(widget.task.includes.length + 1,
                        (index) {
                        if (index == widget.task.includes.length) {
                          return Card(
                            child: ListTile(
                              title: Text(t.page.tasks.edit.add_inclusion),
                              leading: Icon(Icons.add),
                              onTap: () {
                                showDialog<AlertDialog>(
                                  context: context,
                                  builder: (context) {
                                    return addEditInclusion(
                                      context,
                                      false,
                                      ServiceRemoteInclusion(),
                                      state,
                                      (inclusion) {
                                        setState(() {
                                          editTask.includes.add(inclusion);
                                          Navigator.pop(context);
                                        });
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        }
                        final include = widget.task.includes[index];
                        final format =
                            "${include.url} -> ${include.destination}";
                        return Card(
                          child: ListTile(
                            title: Text(format),
                            leading: Icon(Icons.download_sharp),
                            trailing: IconButton(
                              color: Theme.of(context).errorColor,
                              icon: Icon(
                                Icons.delete_forever,
                              ),
                              onPressed: () {
                                showDialog<AlertDialog>(
                                  context: context,
                                  builder: (context) {
                                    return deleteDialog(
                                      context,
                                      onCancel: () {
                                        Navigator.pop(context);
                                      },
                                      onDelete: () {
                                        setState(() {
                                          editTask.includes.removeAt(index);
                                          Navigator.pop(context);
                                        });
                                      },
                                      item: format,
                                    );
                                  },
                                );
                              },
                            ),
                            onTap: () {
                              showDialog<AlertDialog>(
                                context: context,
                                builder: (context) {
                                  return addEditInclusion(
                                    context,
                                    true,
                                    include,
                                    state,
                                    (inclusions) {
                                      setState(() {
                                        editTask.includes.removeAt(index);
                                        editTask.includes.add(inclusions);
                                        Navigator.pop(context);
                                      });
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        );
                      })
                    : [
                        Card(
                          child: ListTile(
                            title: Text(t.page.tasks.edit.no_inclusions),
                            enabled: false,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(t.page.tasks.edit.add_inclusion),
                            enabled: true,
                            leading: Icon(Icons.add),
                            onTap: () {
                              showDialog<AlertDialog>(
                                context: context,
                                builder: (context) {
                                  return addEditInclusion(
                                    context,
                                    false,
                                    ServiceRemoteInclusion(),
                                    state,
                                    (inclusions) {
                                      setState(() {
                                        editTask.includes.add(inclusions);
                                        Navigator.pop(context);
                                      });
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildJavaCommand() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.name,
            controller: _javaCommandController,
            enabled: false,
            decoration:
                InputDecoration(labelText: t.page.tasks.edit.java_command),
          ),
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> _buildEnvironments(NodeState state) {
    return state.node?.versions
            .map((e) => e.environmentType ?? '')
            .toSet()
            .toList()
            .map((e) => DropdownMenuItem<String>(
                  child: Text(e),
                  value: e,
                ))
            .toList() ??
        [];
  }

  Widget _buildEnvironment(NodeState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            items: _buildEnvironments(state),
            value: widget.task.processConfiguration?.environment,
            onChanged: (value) {
              editTask = editTask.copyWith(
                  processConfiguration: editTask.processConfiguration?.copyWith(
                environment: value,
              ));
            },
          ),
        )
      ],
    );
  }

  // Smart Config

  Widget _buildSmartEnabled() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(t.general.enabled),
          ],
        ),
        Column(
          children: [
            Switch(
              value: _config?.enabled ?? false,
              onChanged: (value) {
                setState(() {
                  editTask.properties.update(
                    "smartConfig",
                    (dynamic v) => _config?.copyWith(enabled: value).toJson(),
                  );
                });
              },
            )
          ],
        )
      ],
    );
  }

  Widget _buildSmartSplitLogicOverNodes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text('Split Logically over nodes'),
          ],
        ),
        Column(
          children: [
            Switch(
              value: _config?.splitLogicallyOverNodes ?? false,
              onChanged: (value) {
                setState(() {
                  editTask.properties.update(
                    "smartConfig",
                    (dynamic v) => _config
                        ?.copyWith(splitLogicallyOverNodes: value)
                        .toJson(),
                  );
                });
              },
            )
          ],
        )
      ],
    );
  }

  Widget _buildSmartDirectTemplateInclusions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: Text('Direct template and inclusions Setup')),
        Column(
          children: [
            Switch(
              value: _config?.directTemplatesAndInclusionsSetup ?? false,
              onChanged: (value) {
                setState(() {
                  editTask.properties.update(
                    "smartConfig",
                    (dynamic v) => _config
                        ?.copyWith(directTemplatesAndInclusionsSetup: value)
                        .toJson(),
                  );
                });
              },
            )
          ],
        )
      ],
    );
  }

  Widget _buildSmartPriority() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            controller: _smartConfigPriority!,
            decoration: const InputDecoration(labelText: 'Priority'),
          ),
        ),
      ],
    );
  }

  Widget _buildSmartMaxServices() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            controller: _smartConfigMaxServices!,
            decoration: const InputDecoration(labelText: 'Max Services'),
          ),
        )
      ],
    );
  }

  Widget _buildSmartPreparedMaxServices() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            controller: _smartConfigPreparedServices!,
            decoration: const InputDecoration(labelText: 'Prepared Services'),
          ),
        )
      ],
    );
  }

  Widget _buildSmartSmartMinServiceCount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            controller: _smartConfigSmartMinServiceCount!,
            decoration:
                const InputDecoration(labelText: 'Smart Min Service Count'),
          ),
        )
      ],
    );
  }

  Widget _buildSmartAutoStopOfUnusedService() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            controller: _smartConfigAutoStopTimeByUnusedServiceInSeconds!,
            decoration: const InputDecoration(
                labelText: 'Auto stop time by unused services in seconds'),
          ),
        )
      ],
    );
  }

  Widget _buildSmartAutoStopViaPercentage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            controller:
                _smartConfigPercentOfPlayersToCheckShouldStopTheService!,
            decoration: const InputDecoration(
                labelText:
                    'Percent of player to check should stop the service'),
          ),
        )
      ],
    );
  }

  Widget _buildSmartTimeDelayForNewService() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            controller: _smartConfigForAnewInstanceDelayTimeInSeconds!,
            decoration: const InputDecoration(
                labelText: 'For a new instance delay time in seconds'),
          ),
        )
      ],
    );
  }

  Widget _buildSmartPercentageForNewService() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            controller: _smartConfigPercentOfPlayersForANewServiceByInstance!,
            decoration: const InputDecoration(
                labelText: 'Percent of players for a new service'),
          ),
        )
      ],
    );
  }

  // Required Permission

  Widget _buildRequiredPermission() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.name,
            controller: _requiredPermissionPermission,
            decoration: InputDecoration(labelText: "Permission"),
          ),
        ),
      ],
    );
  }
}
