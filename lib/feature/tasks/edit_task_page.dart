import 'package:async_redux/async_redux.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_task.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/smart_config.dart';
import 'package:cloudnet/state/app_state.dart';
import 'package:cloudnet/state/node_state.dart';
import 'package:cloudnet/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

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

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _javaCommandController = TextEditingController();
  final TextEditingController _environmentCommandController =
      TextEditingController();
  final TextEditingController _portController = TextEditingController();
  final TextEditingController _minServiceController = TextEditingController();
  final TextEditingController _maxHeapController = TextEditingController();

  late TextEditingController? _smartConfigPriority;
  late TextEditingController? _smartConfigMaxServices;
  late TextEditingController? _smartConfigPreparedServices;
  late TextEditingController? _smartConfigSmartMinServiceCount;
  late TextEditingController? _smartConfigAutoStopTimeByUnusedServiceInSeconds;
  late TextEditingController?
      _smartConfigPercentOfPlayersToCheckShouldStopTheService;
  late TextEditingController? _smartConfigForAnewInstanceDelayTimeInSeconds;
  late TextEditingController?
      _smartConfigPercentOfPlayersForANewServiceByInstance;
  late SmartConfig? _config;

  @override
  void initState() {
    task = widget.task;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ServiceTask task = widget.task;
    _nameController.text = task.name ?? '';
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
                          title: Text('Basic Configuration',
                              style: Theme.of(context).textTheme.headline5),
                          childrenPadding:
                              EdgeInsets.only(left: 16.0, right: 16.0),
                          children: [
                            _buildName(),
                            _buildJavaCommand(),
                            _buildEnvironment(vm),
                            _buildPort(),
                            _buildMinServiceCount(),
                            _buildMaxHeap(),
                            _buildMaintenance(),
                            _buildStatic(),
                            _buildGroups(vm),
                            _buildDeployments(vm),
                            //_buildIncludes(vm), // Need be fixed
                          ],
                        ),
                        _config != null
                            ? ExpansionTile(
                                title: Text('Smart Config',
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
    _formKey.currentState!.validate();
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
            decoration: const InputDecoration(labelText: 'Name'),
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
            decoration: const InputDecoration(labelText: 'Start Port'),
            validator: ValidationBuilder()
                .required("Port is required")
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
    return "Not valid";
  }

  String? _min(String? value, int min) {
    if (value != null) {
      if (int.parse(value) >= min) {
        return null;
      }
    }
    return "Not valid";
  }

  Widget _buildMinServiceCount() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: _minServiceController,
            decoration: const InputDecoration(labelText: 'Min Service Count'),
            validator: ValidationBuilder()
                .required("Min Service count is required")
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
            decoration: const InputDecoration(labelText: 'Max Heap'),
            validator: ValidationBuilder()
                .required("Port is required")
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
            Text('Maintenance'),
          ],
        ),
        Column(
          children: [
            Switch(
              value: widget.task.maintenance,
              onChanged: (value) {},
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
            Text('Static'),
          ],
        ),
        Column(
          children: [
            Switch(
              value: widget.task.staticServices,
              onChanged: (value) {},
            )
          ],
        )
      ],
    );
  }

  Widget _buildGroups(NodeState state) {
    //TODO: Input Dialog
    return InkWell(
      onLongPress: () {
        showDialog<AlertDialog>(
          context: context,
          builder: (context) {
            return selectGroups(context, state, widget.task);
          },
        );
      },
      child: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Groups'),
            Wrap(
              spacing: 8,
              children: List<Widget>.generate(widget.task.groups?.length ?? 0,
                  (index) {
                return Chip(label: Text(widget.task.groups?[index] ?? ''));
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDeployments(NodeState state) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text('Deployments'),
              ListView(
                shrinkWrap: true,
                children: widget.task.deployments.isNotEmpty
                    ? List<Widget>.generate(widget.task.deployments.length + 1,
                        (index) {
                        if (index == widget.task.deployments.length) {
                          return Card(
                            child: ListTile(
                              title: Text('Add Deployment'),
                              leading: Icon(Icons.add),
                              enabled: false,
                              onTap: () {
                                showDialog<AlertDialog>(
                                  context: context,
                                  builder: (context) {
                                    return addEditDeployment(
                                        context, false, null, state);
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
                                      context, true, deployment, state);
                                },
                              );
                            },
                          ),
                        );
                      })
                    : [
                        const Card(
                          child: ListTile(
                            title: Text('No deployments'),
                            enabled: false,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text('Add Deployment'),
                            enabled: false,
                            leading: Icon(Icons.add),
                            onTap: () {
                              /*showDialog<AlertDialog>(
                                context: context,
                                builder: (context) {
                                  return addEditDeployment(
                                      context, false, null, state);
                                },
                              );*/
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
  } //TODO: Input Dialog

  Widget _buildIncludes(NodeState state) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Flexible(child: Text('Includes')),
              ListView(
                shrinkWrap: true,
                children: widget.task.includes.isNotEmpty
                    ? List<Widget>.generate(widget.task.includes.length + 1,
                        (index) {
                        if (index == widget.task.includes.length) {
                          return Card(
                            child: ListTile(
                              title: Text('Add inclusion'),
                              leading: Icon(Icons.add),
                              onTap: () {
                                showDialog<AlertDialog>(
                                  context: context,
                                  builder: (context) {
                                    return addEditInclusion(
                                        context, false, null, state);
                                  },
                                );
                              },
                            ),
                          );
                        }
                        final include = widget.task.includes[index];
                        final format = "${include.url}";
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
                                        Navigator.pop(context);
                                      },
                                      item: format,
                                    );
                                  },
                                );
                              },
                            ),
                            onTap: () {},
                          ),
                        );
                      })
                    : [
                        const Card(
                          child: ListTile(
                            title: Text('No inclusions'),
                            enabled: false,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text('Add Deployment'),
                            enabled: false,
                            leading: Icon(Icons.add),
                            onTap: () {
                              showDialog<AlertDialog>(
                                context: context,
                                builder: (context) {
                                  return addEditDeployment(
                                      context, false, null, state);
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
  } //TODO: Input Dialog

  Widget _buildJavaCommand() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.name,
            controller: _javaCommandController,
            enabled: false,
            decoration: const InputDecoration(labelText: 'Java Command'),
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
          child: DropdownButtonFormField(
            items: _buildEnvironments(state),
            value: widget.task.processConfiguration?.environment,
            onChanged: (value) {},
          ),
        )
      ],
    );
  } //TODO: Drop Down

  // Smart Config

  Widget _buildSmartEnabled() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text('Enabled'),
          ],
        ),
        Column(
          children: [
            Switch(
              value: _config?.enabled ?? false,
              onChanged: (value) {},
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
              onChanged: (value) {},
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
              onChanged: (value) {},
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
            controller: _smartConfigPriority,
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
            controller: _smartConfigMaxServices,
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
            controller: _smartConfigPreparedServices,
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
            controller: _smartConfigSmartMinServiceCount,
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
            controller: _smartConfigAutoStopTimeByUnusedServiceInSeconds,
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
            controller: _smartConfigPercentOfPlayersToCheckShouldStopTheService,
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
            controller: _smartConfigForAnewInstanceDelayTimeInSeconds,
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
            controller: _smartConfigPercentOfPlayersForANewServiceByInstance,
            decoration: const InputDecoration(
                labelText: 'Percent of players for a new service'),
          ),
        )
      ],
    );
  }
}
