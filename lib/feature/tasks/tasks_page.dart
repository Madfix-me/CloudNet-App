import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_task.dart';
import 'package:cloudnet/feature/tasks/task_setup_page.dart';
import 'package:cloudnet/state/actions/node_actions.dart';
import 'package:cloudnet/state/app_state.dart';
import 'package:cloudnet/utils/dialogs.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloudnet/i18n/strings.g.dart';
import 'package:search_choices/search_choices.dart';

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
  late ScrollController _scrollController;
  bool _scrolling = false;
  final List<DropdownMenuItem<String>> searchItems = List.empty(growable: true);
  List<int> selectedItemsMultiDialog = List.empty();

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    searchItems.add(
      DropdownMenuItem<String>(
        child: Text(t.page.tasks.overview.static_service),
        value: 'static_service',
      ),
    );
    searchItems.add(
      DropdownMenuItem<String>(
        child: Text(t.page.tasks.overview.maintenance),
        value: 'maintenance',
      ),
    );

    super.initState();
  }

  void _scrollListener() {
    setState(() {
      _scrolling = _scrollController.position.pixels != 0;
    });
  }

  void _onError(dynamic error) {
    SnackBar snackBar = SnackBar(
      content: Text('An error concurrent'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onCompleted() {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text("Item Completed")));

  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<ServiceTask>>(
      onInit: (store) {
        store.dispatch(InitMetaInformation(_onCompleted, _onError));
      },
      converter: (store) =>
          store.state.nodeState.node?.tasks.where((e) => filter(e)).toList() ??
          List.empty(),
      builder: (context, tasks) => Stack(
        children: [
          RefreshIndicator(
            onRefresh: _pullRefresh,
            child: Column(
              children: [
                SearchChoices<String>.multiple(
                  items: searchItems,
                  hint: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text("Select your filter"),
                  ),
                  searchHint: 'Select your filter',
                  selectedItems: selectedItemsMultiDialog,
                  isExpanded: true,
                  onChanged: (List<int> value) {
                    setState(() {
                      selectedItemsMultiDialog = value;
                    });
                  },
                  displayItem: (Widget item, bool selected) {
                    return Row(
                      children: [
                        selected
                            ? const Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.check_box_outline_blank,
                                color: Colors.grey,
                              ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: item,
                        ),
                      ],
                    );
                  },
                  selectedValueWidgetFn: (String item) {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      child: Chip(
                        padding: const EdgeInsets.all(6.0),
                        label: searchItems
                            .where((element) => element.value == item)
                            .first
                            .child,
                      ),
                    );
                  },
                  selectedAggregateWidgetFn: (List<Widget> list) {
                    return Row(
                      children: [
                        Wrap(children: list),
                      ],
                    );
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: tasks.length,
                    controller: _scrollController,
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
                                    Text(t.general.formats.mb(
                                        value: task.processConfiguration!
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
                                    Text(t
                                        .page.tasks.overview.service_min_count),
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
                                    Text(t.page.tasks.overview
                                        .auto_delete_on_stop),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(task.autoDeleteOnStop
                                        ? t.general.yes
                                        : t.general.no)
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
                                      task.staticServices
                                          ? t.general.yes
                                          : t.general.no,
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
                                      task.maintenance
                                          ? t.general.yes
                                          : t.general.no,
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
                                    Text(t.page.tasks.overview
                                        .disable_ip_rewrite),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(task.disableIpRewrite
                                        ? t.general.yes
                                        : t.general.no)
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
                                IconButton(
                                  onPressed: () {
                                    context.push('/tasks/task-edit',
                                        extra: task);
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog<AlertDialog>(
                                      context: context,
                                      builder: (context) {
                                        return deleteDialog(
                                          context,
                                          onCancel: () {
                                            context.pop();
                                          },
                                          onDelete: () {},
                                          item: task.name ?? '',
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          _scrolling
              ? Container()
              : Positioned(
                  child: FloatingActionButton(
                    onPressed: () {
                      context.goNamed(TaskSetupPage.name);
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
    StoreProvider.dispatch(context, UpdateTasks());
  }

  bool filter(ServiceTask element) {

    if (staticFilter == false && maintenanceFilter == false) {
      return true;
    }
    return element.staticServices == staticFilter &&
        element.maintenance == maintenanceFilter;
  }
}
