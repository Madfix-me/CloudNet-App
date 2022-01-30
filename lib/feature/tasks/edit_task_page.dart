import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_task.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/smart_config.dart';
import 'package:flutter/material.dart';

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
  late SmartConfig? _config;

  @override
  Widget build(BuildContext context) {
    final ServiceTask task = widget.task;
    _nameController.text = task.name ?? '';
    _portController.text = task.startPort?.toString() ?? '';
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
          TextEditingValue(text: _config?.smartMinServiceCount.toString() ?? ''));
      _smartConfigAutoStopTimeByUnusedServiceInSeconds =
          TextEditingController.fromValue(TextEditingValue(
              text: _config?.autoStopTimeByUnusedServiceInSeconds.toString() ?? ''));
      _smartConfigPercentOfPlayersToCheckShouldStopTheService =
          TextEditingController.fromValue(TextEditingValue(
              text: _config?.percentOfPlayersToCheckShouldStopTheService
                  .toString() ?? ''));
      _smartConfigForAnewInstanceDelayTimeInSeconds =
          TextEditingController.fromValue(TextEditingValue(
              text: _config?.forAnewInstanceDelayTimeInSeconds.toString() ?? ''));
      _smartConfigPercentOfPlayersForANewServiceByInstance =
          TextEditingController.fromValue(TextEditingValue(
              text:
              _config?.percentOfPlayersForANewServiceByInstance.toString() ?? ''));
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          ExpansionTile(
            title: Text('Basic Configuration',
                style: Theme.of(context).textTheme.headline5),
            childrenPadding: EdgeInsets.only(left: 8.0, right: 8.0),
            children: [
              _buildName(),
              _buildPort(),
              _buildMinServiceCount(),
              _buildMaxHeap(),
              _buildMaintenance(),
              _buildStatic(),
              _buildGroups(),
              _buildDeployments(),
              _buildIncludes(),
            ],
          ),
          _config != null
              ? ExpansionTile(
                  title: Text('Smart Config',
                      style: Theme.of(context).textTheme.headline5),
                  childrenPadding:
                      const EdgeInsets.only(left: 16.0, right: 16.0),
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
    );
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
          child: TextField(
            keyboardType: TextInputType.number,
            controller: _portController,
            decoration:
            const InputDecoration(labelText: 'Start Port'),
          ),
        ),
      ],
    );
  }

  Widget _buildMinServiceCount() {
    return Row(
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
    );
  }

  Widget _buildMaxHeap() {
    return Row(
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

  Widget _buildGroups() {
    return GestureDetector(
      onLongPress: () {
        SnackBar bar = SnackBar(content: Text(' Just a test'));
        ScaffoldMessenger.of(context).showSnackBar(bar);
      },
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
    );
  }

  Widget _buildDeployments() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text('Deployments'),
              ListView(
                shrinkWrap: true,
                children: widget.task.deployments.isNotEmpty
                    ? List<Widget>.generate(widget.task.deployments.length,
                        (index) {
                      final deployment = widget.task.deployments[index];
                      final format =
                          '${deployment.template?.storage}:${deployment.template?.prefix}/${deployment.template?.name}';
                      return Card(
                        child: ListTile(
                          title: Text(format),
                          subtitle: deployment
                              .excludes.isNotEmpty ==
                              true
                              ? ListView(
                            shrinkWrap: true,
                            children: List<Widget>.generate(
                                deployment.excludes.length , (index) {
                              return Text(
                                  '- ${deployment.excludes[index]}');
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
    );
  }

  Widget _buildIncludes() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text('Includes'),
              ListView(
                shrinkWrap: true,
                children: widget.task.includes.isNotEmpty
                    ? List<Widget>.generate(widget.task.includes.length,
                        (index) {
                      final include = widget.task.includes[index];
                      return Card(
                        child: ListTile(
                          title: Text(include.url ?? ''),
                          subtitle:
                          Text('-> ${include.destination}'),
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
    );
  }

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
        Column(
          children: [
            Text('Direct template and inclusions Setup'),
          ],
        ),
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
            decoration:
            const InputDecoration(labelText: 'Priority'),
          ),
        ),
        Tooltip(
          message: 'Allow the priority of task starting',
          child: Icon(Icons.info),
        )
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
            decoration: const InputDecoration(
                labelText: 'Max Services'),
          ),
        ),
        Tooltip(
          message: 'Max amount of services',
          child: Icon(Icons.info),
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
    );
  }

  Widget _buildSmartSmartMinServiceCount() {
    return  Row(
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
    );
  }

  Widget _buildSmartAutoStopOfUnusedService() {
    return Row(
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
    );
  }

  Widget _buildSmartAutoStopViaPercentage() {
    return  Row(
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
    );
  }

  Widget _buildSmartTimeDelayForNewService() {
    return Row(
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
    );
  }

  Widget _buildSmartPercentageForNewService() {
    return Row(
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
    );
  }
}
