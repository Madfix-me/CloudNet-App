import 'package:cloudnet/apis/cloudnetv3spec/model/service_task.dart';
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

  @override
  Widget build(BuildContext context) {
    final ServiceTask task = widget.task;
    _nameController.text = task.name ?? '';
    _portController.text = task.startPort?.toString() ?? '';
    return Container(
      child: Column(
        children: [
          Text(
            task.name ?? '',
            style: Theme.of(context).textTheme.headline3,
          ),
          ExpansionTile(
            title: Text('Boolische Werte',
                style: Theme.of(context).textTheme.headline5),
            childrenPadding: EdgeInsets.only(left: 16.0, right: 16.0),
            children: [
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
                  Column(
                    children: [
                      Text('Auto Delete on Stop'),
                    ],
                  ),
                  Column(
                    children: [
                      Switch(
                        value: task.autoDeleteOnStop,
                        onChanged: (value) {},
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          ExpansionTile(
            title: Text('String Werte',
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
                      decoration: InputDecoration(
                        labelText: 'Name'
                      ),
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
                      decoration: InputDecoration(
                          labelText: 'Start Port'
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
