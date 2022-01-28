import 'package:cloudnet/apis/cloudnetv3spec/model/service_task.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/smart_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditTaskPage extends StatefulWidget {
  const EditTaskPage({required this.task, Key? key}) : super(key: key);
  final ServiceTask task;

  static const String route = 'task-edit';
  static const String name = 'task-edit';

  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  final TextEditingController _nameController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    final ServiceTask task = widget.task;
    _nameController.text = task.name ?? '';
    _portController.text = task.startPort?.toString() ?? '';
    _minServiceController.text = task.minServiceCount?.toString() ?? '';
    _maxHeapController.text =
        task.processConfiguration?.maxHeapMemorySize?.toString() ?? '';
    SmartConfig? config;
    if (task.properties.containsKey('smartConfig')) {
      config = SmartConfig.fromJson(
          task.properties['smartConfig'] as Map<String, dynamic>);
      _smartConfigPriority = TextEditingController.fromValue(
          TextEditingValue(text: config.priority.toString()));
      _smartConfigMaxServices = TextEditingController.fromValue(
          TextEditingValue(text: config.maxServices.toString()));
      _smartConfigPreparedServices = TextEditingController.fromValue(
          TextEditingValue(text: config.preparedServices.toString()));
      _smartConfigSmartMinServiceCount = TextEditingController.fromValue(
          TextEditingValue(text: config.smartMinServiceCount.toString()));
      _smartConfigAutoStopTimeByUnusedServiceInSeconds =
          TextEditingController.fromValue(TextEditingValue(
              text: config.autoStopTimeByUnusedServiceInSeconds.toString()));
      _smartConfigPercentOfPlayersToCheckShouldStopTheService =
          TextEditingController.fromValue(TextEditingValue(
              text: config.percentOfPlayersToCheckShouldStopTheService
                  .toString()));
      _smartConfigForAnewInstanceDelayTimeInSeconds =
          TextEditingController.fromValue(TextEditingValue(
              text: config.forAnewInstanceDelayTimeInSeconds.toString()));
      _smartConfigPercentOfPlayersForANewServiceByInstance =
          TextEditingController.fromValue(TextEditingValue(
              text:
                  config.percentOfPlayersForANewServiceByInstance.toString()));
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          ExpansionTile(
            title: Text('Basic Configuration',
                style: Theme.of(context).textTheme.headline5),
            childrenPadding: EdgeInsets.only(left: 8.0, right: 8.0),
            children: [
              Row(
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
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _portController,
                      decoration:
                          const InputDecoration(labelText: 'Start Port'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _minServiceController,
                      decoration:
                          const InputDecoration(labelText: 'Min Service Count'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _maxHeapController,
                      decoration: const InputDecoration(labelText: 'Max Heap'),
                    ),
                  ),
                  Tooltip(
                    message: 'Is set in MB not GB',
                    child: Icon(Icons.info),
                  )
                ],
              ),
              Row(
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
                        value: task.maintenance,
                        onChanged: (value) {},
                      )
                    ],
                  )
                ],
              ),
              Row(
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
                        value: task.staticServices,
                        onChanged: (value) {},
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Groups'),
                  Wrap(
                    spacing: 8,
                    children: List<Widget>.generate(task.groups?.length ?? 0,
                        (index) {
                      return Chip(label: Text(task.groups?[index] ?? ''));
                    }),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('Deployments'),
                        ListView(
                          shrinkWrap: true,
                          children: task.deployments.isNotEmpty
                              ? List<Widget>.generate(task.deployments.length,
                                  (index) {
                                  final deployment = task.deployments[index];
                                  final format =
                                      '${deployment.template?.storage}:${deployment.template?.prefix}/${deployment.template?.name}';
                                  return Card(
                                    child: ListTile(
                                      title: Text(format),
                                      subtitle: deployment
                                                  .excludes?.isNotEmpty ==
                                              true
                                          ? ListView(
                                              shrinkWrap: true,
                                              children: List<Widget>.generate(
                                                  deployment.excludes?.length ??
                                                      0, (index) {
                                                return Text(
                                                    '- ${deployment.excludes?[index]}');
                                              }),
                                            )
                                          : null,
                                    ),
                                  );
                                })
                              : [
                                  const Card(
                                    child: ListTile(
                                      title: Text('No deployments'),
                                    ),
                                  ),
                                ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('Includes'),
                        ListView(
                          shrinkWrap: true,
                          children: task.includes.isNotEmpty
                              ? List<Widget>.generate(task.includes.length,
                                  (index) {
                                  final include = task.includes[index];
                                  return Card(
                                    child: ListTile(
                                      title: Text(include.url ?? ''),
                                      subtitle: Text('-> ${include.destination}'),
                                    ),
                                  );
                                })
                              : [
                                  const Card(
                                    child: ListTile(
                                      title: Text('No inclusions'),
                                    ),
                                  ),
                                ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          config != null
              ? ExpansionTile(
                  title: Text('Smart Config',
                      style: Theme.of(context).textTheme.headline5),
                  childrenPadding:
                      const EdgeInsets.only(left: 16.0, right: 16.0),
                  children: [
                    Row(
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
                              value: config.enabled,
                              onChanged: (value) {},
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
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
                              value: config.splitLogicallyOverNodes,
                              onChanged: (value) {},
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('Direct template and inclusions Setup'),
                          ],
                        ),
                        Column(
                          children: [
                            Switch(
                              value: config.directTemplatesAndInclusionsSetup,
                              onChanged: (value) {},
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _smartConfigPriority,
                            decoration:
                                const InputDecoration(labelText: 'Priority'),
                          ),
                        ),
                        Tooltip(
                          message: 'Allow the priority of task starting',
                          child: Icon(Icons.info),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _smartConfigMaxServices,
                            decoration: const InputDecoration(
                                labelText: 'Max Services'),
                          ),
                        ),
                        Tooltip(
                          message: 'Max amount of services',
                          child: Icon(Icons.info),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _smartConfigPreparedServices,
                            decoration: const InputDecoration(
                                labelText: 'Prepared Services'),
                          ),
                        ),
                        Tooltip(
                          message:
                              'Services they a running but not visible for SignSystem or other systems',
                          child: Icon(Icons.info),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _smartConfigSmartMinServiceCount,
                            decoration: const InputDecoration(
                                labelText: 'Smart Min Service Count'),
                          ),
                        ),
                        Tooltip(
                          message:
                              'Same like normal min count but only for smart config',
                          child: Icon(Icons.info),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller:
                                _smartConfigAutoStopTimeByUnusedServiceInSeconds,
                            decoration: const InputDecoration(
                                labelText:
                                    'Auto stop time by unused services in seconds'),
                          ),
                        ),
                        Tooltip(
                          message:
                              'In seconds how long services are empty before get stoppend',
                          child: Icon(Icons.info),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller:
                                _smartConfigPercentOfPlayersToCheckShouldStopTheService,
                            decoration: const InputDecoration(
                                labelText:
                                    'Percent of player to check should stop the service'),
                          ),
                        ),
                        Tooltip(
                          message: 'Soon',
                          child: Icon(Icons.info),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller:
                                _smartConfigForAnewInstanceDelayTimeInSeconds,
                            decoration: const InputDecoration(
                                labelText:
                                    'For a new instance delay time in seconds'),
                          ),
                        ),
                        Tooltip(
                          message: 'Soon',
                          child: Icon(Icons.info),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller:
                                _smartConfigPercentOfPlayersForANewServiceByInstance,
                            decoration: const InputDecoration(
                                labelText:
                                    'Percent of players for a new service'),
                          ),
                        ),
                        Tooltip(
                          message: 'Soon',
                          child: Icon(Icons.info),
                        )
                      ],
                    )
                  ],
                )
              : Flex(direction: Axis.horizontal),
        ],
      ),
    );
  }
}
