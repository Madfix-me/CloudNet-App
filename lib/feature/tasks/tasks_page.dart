import 'package:CloudNet/apis/cloudnetv3spec/model/service_task.dart';
import 'package:CloudNet/feature/tasks/task_setup_page.dart';
import 'package:CloudNet/state/actions/app_actions.dart';
import 'package:CloudNet/state/app_state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:go_router/go_router.dart';
import '/utils/color.dart' as color;
import 'package:CloudNet/i18n/strings.g.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  static const String route = '/tasks';
  static const String name = 'tasks';

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  bool staticFilter = false;
  bool maintenanceFilter = false;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<ServiceTask>>(
      onInit: (store) {
        store.dispatch(InitAppStateAction());
      },
      converter: (store) => store.state.tasks!.where((e) => filter(e)).toList(),
      builder: (context, tasks) => Stack(
        children: [
          Column(
            children: [
              Wrap(
                children: [
                  FilterChip(
                    label: Text(t.page.tasks.overview.static_service),
                    selected: staticFilter,
                    onSelected: (bool value) {
                      setState(() {
                        staticFilter = value;
                      });
                    },
                  ),
                  FilterChip(
                    label: Text(t.page.tasks.overview.maintenance),
                    selected: maintenanceFilter,
                    onSelected: (bool value) {
                      setState(() {
                        maintenanceFilter = value;
                      });
                    },
                  )
                ],
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _pullRefresh,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: tasks.length,
                    itemBuilder: (context, i) {
                      final ServiceTask task = tasks[i];
                      return ExpansionTile(
                        title: Text(task.name!),
                        subtitle: Text(task.processConfiguration!.environment!),
                        children: <Widget>[
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(t.page.tasks.overview.memory),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(t.general.formats.mb(value: task.processConfiguration!
                                        .maxHeapMemorySize!
                                        .toString()))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(t.page.tasks.overview.service_min_count),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(task.minServiceCount!.toString())
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(t.page.tasks.overview.auto_delete_on_stop),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(task.autoDeleteOnStop! ? t.general.yes : t.general.no)
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      t.page.tasks.overview.static_service,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      task.staticServices! ? t.general.yes : t.general.no,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      t.page.tasks.overview.maintenance,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      task.maintenance! ? t.general.yes : t.general.no,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(t.page.tasks.overview.disable_ip_rewrite),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(task.disableIpRewrite! ? t.general.yes : t.general.no)
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Elusive.wrench,
                                            color: task.maintenance!
                                                ? null
                                                : color.gray,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.edit),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            child: FloatingActionButton(
              onPressed: () {
                context.push(TaskSetupPage.route);
              },
              child: const Icon(Icons.add),
            ),
            bottom: 16,
            right: 16,
          ),
        ],
      ),
    );
  }

  Future<void> _pullRefresh() async {
    StoreProvider.dispatch(context, UpdateTasksAction());
  }

  bool filter(ServiceTask element) {
    if (staticFilter == false && maintenanceFilter == false) {
      return true;
    }
    return element.staticServices == staticFilter &&
        element.maintenance == maintenanceFilter;
  }
}
