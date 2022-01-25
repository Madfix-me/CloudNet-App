import 'package:cloudnet/apis/cloudnetv3spec/model/group_configuration.dart';
import 'package:cloudnet/state/actions/node_actions.dart';
import 'package:cloudnet/state/app_state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({Key? key}) : super(key: key);

  static const String route = '/groups';
  static const String name = 'groups';

  @override
  _GroupsPageState createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {

  void _onError(dynamic error) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: Text("Error Occurred")));
  }

  void _onCompleted() {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text("Item Completed")));

  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<GroupConfiguration>>(
        onInit: (store) {
          store.dispatch(InitMetaInformation(_onCompleted, _onError));
        },
        converter: (store) => store.state.nodeState.node?.groups ?? List.empty(),
        builder: (context, groups) => Stack(
              children: [
                RefreshIndicator(
                  onRefresh: _pullRefresh,
                  child: ListView.builder(
                    itemCount: groups.length,
                    itemBuilder: (context, i) {
                      final GroupConfiguration group = groups[i];
                      return ExpansionTile(
                        title: Text(group.name!),
                        children: <Widget>[
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: const [
                                    Text('Environments Count'),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(group.targetEnvironments!.length
                                        .toString())
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
                                  children: const [
                                    Text('Deployment Count'),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(group.deployments!.length.toString())
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
                                  children: const [
                                    Text('Jvm Options Count'),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(group.jvmOptions!.length.toString())
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
                                  children: const [
                                    Text('Templates Count'),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(group.templates!.length.toString())
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
                                  children: const [
                                    Text('Inclusions Count'),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(group.includes!.length.toString())
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.add),
                  ),
                )
              ],
            ));
  }

  Future<void> _pullRefresh() async {}
}
