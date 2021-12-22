import 'package:flutter/cupertino.dart';
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

  @override
  Widget build(BuildContext context) {
    return Stepper(
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
                Text('What should the name of the new task be?'),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      errorBorder: const OutlineInputBorder(
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
          title: Text('Memory'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Text(
                    'What amount of max memory should the new task have? (in MB)'),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      errorBorder: const OutlineInputBorder(
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
          title: Text('Maintaince default'),
          content: Container(
            child: Column(
              children: [
                Text(
                    'Should the task be in maintenance by default? (this prevents auto starting of the services)'),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Switch(
                    value: false,
                    onChanged: (value) {},

                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
          title: Text('Auto delete'),
          content: Container(
            child: Column(
              children: [
                Text(
                    'Should the services be automatically unregistered out of the cloud after stopping them?'),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Switch(
                    value: true,
                    onChanged: (value) {},

                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
          title: Text('Static Service'),
          content: Container(
            child: Column(
              children: [
                Text(
                    'Should the services of this task be static that their files are never deleted'),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Switch(
                    value: true,
                    onChanged: (value) {},

                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
