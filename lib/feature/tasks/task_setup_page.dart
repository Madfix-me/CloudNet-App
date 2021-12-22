import 'package:CloudNet/apis/cloudnetv3spec/model/service_version.dart';
import 'package:CloudNet/apis/cloudnetv3spec/model/service_version_type.dart';
import 'package:CloudNet/state/actions/app_actions.dart';
import 'package:CloudNet/state/app_state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<ServiceVersionType>>(
      onInit: (store) {
        store.dispatch(InitAppStateAction());
      },
      converter: (store) => store.state.versions ?? List.empty(),
      builder: (context, versions) => Stepper(
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },
        onStepContinue: () {
          if (_index <= 0) {
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
        steps: <Step>[
          Step(
            title: const Text('Task Name'),
            content: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  const Text('What should the name of the new task be?'),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        labelText: 'Task name',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Step(
            title: const Text('Memory'),
            content: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  const Text(
                      'What amount of max memory should the new task have? (in MB)'),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      initialValue: '512',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        labelText: 'Memory',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Step(
            title: const Text('Maintaince default'),
            content: Column(
              children: [
                const Text(
                    'Should the task be in maintenance by default? (this prevents auto starting of the services)'),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          Step(
            title: const Text('Auto delete'),
            content: Column(
              children: [
                const Text(
                    'Should the services be automatically unregistered out of the cloud after stopping them?'),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          Step(
            title: const Text('Static Service'),
            content: Column(
              children: [
                const Text(
                    'Should the services of this task be static that their files are never deleted'),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          Step(
            title: const Text('Service Count'),
            content: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  const Text(
                      'How many services of this task should be always online?'),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      initialValue: '1',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        labelText: 'Service Count',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Step(
            title: const Text('Task Environment'),
            content: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  const Text('What should be the environment of this task? '),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: DropdownButtonFormField<String>(
                      items: buildEnvs(versions),
                      onChanged: (String? value) {
                        serviceVersionType = versions.firstWhere((element) =>
                            (element.environmentType ?? '') == (value ?? ''));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Step(
            title: const Text('Start Port'),
            content: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  const Text('What should be the start port of the task?'),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      initialValue: '44955',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        labelText: 'Start Port',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Step(
            title: const Text('Java executable'),
            content: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  const Text('What is the path to the Java executable?'),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      initialValue: 'java',
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        labelText: 'Path',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Step(
            title: const Text('Service Version'),
            content: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  const Text(
                      'Which ServiceVersion should be ran on services of this task?'),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: DropdownButtonFormField<String>(
                      items: buildVersions(
                          versions,
                          serviceVersionType ??
                              const ServiceVersionType(
                                  environmentType: 'MINECRAFT_SERVER')),
                      onChanged: (String? value) {},
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>>? buildEnvs(List<ServiceVersionType> versions) {
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
}
