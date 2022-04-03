import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_deployment.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_remote_inclusion.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_task.dart';
import 'package:cloudnet/i18n/strings.g.dart';
import 'package:cloudnet/state/node_state.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

AlertDialog deleteDialog(BuildContext context,
    {VoidCallback? onDelete, VoidCallback? onCancel, required String item}) {
  return AlertDialog(
    title: EasyRichText(
      t.general.dialogs.delete.title(item: item),
      textAlign: TextAlign.center,
      patternList: [
        EasyRichTextPattern(
          targetString: '(\\*)(.*?)(\\*)',
          matchBuilder: (context, match) {
            return TextSpan(
              text: match?[0]?.replaceAll('*', ''),
              style: const TextStyle(fontWeight: FontWeight.bold),
            );
          },
        )
      ],
    ),
    content: EasyRichText(
      t.general.dialogs.delete.content(item: item),
      textAlign: TextAlign.center,
      patternList: [
        EasyRichTextPattern(
          targetString: '(\\*)(.*?)(\\*)',
          matchBuilder: (context, match) {
            return TextSpan(
              text: match?[0]?.replaceAll('*', ''),
              style: const TextStyle(fontWeight: FontWeight.bold),
            );
          },
        )
      ],
    ),
    actions: [
      Row(
        children: [
          Container(
            child: TextButton(
              onPressed: onDelete,
              child: Text(
                t.general.button.delete,
                textAlign: TextAlign.center,
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.error),
            ),
            margin: const EdgeInsets.all(4.0),
          ),
          Container(
            child: TextButton(
              onPressed: onCancel,
              child: Text(
                t.general.button.cancel,
                textAlign: TextAlign.center,
              ),
            ),
            margin: const EdgeInsets.all(4.0),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      )
    ],
  );
}

CheckboxListTile _buildNodeTile(StateSetter setState, BuildContext context,
    int index, NodeState state, ServiceTask task) {
  final node = state.node?.nodes[index];
  return CheckboxListTile(
    value: task.associatedNodes.contains(node?.node?.uniqueId ?? ''),
    onChanged: (bool? value) {
      setState(() {
        if (value == true) {
          task.associatedNodes.add(node?.node?.uniqueId ?? '');
        } else {
          task.associatedNodes.remove(node?.node?.uniqueId ?? '');
        }
      });
    },
    title: Text(node?.node?.uniqueId ?? ''),
  );
}

StatefulBuilder selectNodes(BuildContext context, NodeState state,
    ServiceTask task, void Function(ServiceTask task) save) {
  return StatefulBuilder(
    builder: (context, setState) => AlertDialog(
      title: Text(t.dialogs.select_nodes.title),
      content: Container(
        height: 300,
        width: 300,
        child: ListView.builder(
          itemBuilder: (context, index) =>
              _buildNodeTile(setState, context, index, state, task),
          shrinkWrap: true,
          itemCount: state.node?.nodes.length,
        ),
      ),
      actions: [
        Row(
          children: [
            Container(
              child: TextButton(
                onPressed: () => save(task),
                child: Text(
                  t.general.button.save,
                  textAlign: TextAlign.center,
                ),
              ),
              margin: const EdgeInsets.all(8.0),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        )
      ],
    ),
  );
}

StatefulBuilder selectGroups(BuildContext context, NodeState state,
    ServiceTask task, void Function(ServiceTask task) save) {
  return StatefulBuilder(
    builder: (context, setState) => AlertDialog(
      title: Text(t.dialogs.select_groups.title),
      content: Container(
        height: 300,
        width: 300,
        child: ListView.builder(
          itemBuilder: (context, index) =>
              _buildGroupTile(setState, context, index, state, task),
          shrinkWrap: true,
          itemCount: state.node?.groups.length,
        ),
      ),
      actions: [
        Row(
          children: [
            Container(
              child: TextButton(
                onPressed: () => save(task),
                child: Text(
                  t.general.button.save,
                  textAlign: TextAlign.center,
                ),
              ),
              margin: const EdgeInsets.all(8.0),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        )
      ],
    ),
  );
}

CheckboxListTile _buildGroupTile(StateSetter setState, BuildContext context,
    int index, NodeState state, ServiceTask task) {
  final group = state.node?.groups[index];
  return CheckboxListTile(
    value: task.groups?.contains(group?.name ?? ''),
    onChanged: (bool? value) {
      setState(() {
        if (value == true) {
          task.groups?.add(group?.name ?? '');
        } else {
          task.groups?.remove(group?.name ?? '');
        }
      });
    },
    title: Text(group?.name ?? ''),
  );
}

StatefulBuilder addEditInclusion(
    BuildContext context,
    bool edit,
    ServiceRemoteInclusion inclusion,
    NodeState state,
    void Function(ServiceRemoteInclusion inclusion) save) {
  var urlController = TextEditingController(text: edit ? inclusion.url : null);
  var savePathController =
      TextEditingController(text: edit ? inclusion.destination : null);
  return StatefulBuilder(
    builder: (context, setState) {
      return SimpleDialog(
        title: edit
            ? Text(t.dialogs.inclusions.title_edit,
                style: Theme.of(context).textTheme.headline3)
            : Text(t.dialogs.inclusions.title_add,
                style: Theme.of(context).textTheme.headline3),
        children: [
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: [
                Text(t.dialogs.inclusions.fields.http_url),
                TextField(
                  keyboardType: TextInputType.url,
                  controller: urlController,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: t.dialogs.inclusions.fields.url,
                  ),
                ),
                Divider(),
                Text(t.dialogs.inclusions.fields.save_path),
                Divider(),
                TextField(
                  keyboardType: TextInputType.name,
                  controller: savePathController,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: t.dialogs.inclusions.fields.file_folder,
                  ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.clear,
                          color: Theme.of(context).colorScheme.error),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          inclusion = inclusion.copyWith(
                              destination: savePathController.text,
                              url: urlController.text);
                          save(inclusion);
                        });
                      },
                      icon: Icon(Icons.save),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      );
    },
  );
}

StatefulBuilder addEditDeployment(
    BuildContext context,
    bool edit,
    ServiceDeployment deployment,
    NodeState state,
    void Function(ServiceDeployment deployment) save) {
  var _excludeController = TextEditingController();
  return StatefulBuilder(
    builder: (context, setState) {
      final format =
          '${deployment.template?.storage}:${deployment.template?.prefix}/${deployment.template?.name}';
      return SimpleDialog(
        title: edit
            ? Text(t.dialogs.deployment.title_edit,
                style: Theme.of(context).textTheme.headline3)
            : Text(t.dialogs.deployment.title_add,
                style: Theme.of(context).textTheme.headline3),
        children: [
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: [
                DropdownButton<String>(
                  items: state.node?.templates.isNotEmpty == true
                      ? List<DropdownMenuItem<String>>.generate(
                          state.node?.templates.length ?? 0, (index) {
                          final template = state.node?.templates[index];
                          final format =
                              '${template?.storage}:${template?.prefix}/${template?.name}';
                          return DropdownMenuItem(
                            child: Text(format),
                            value: format,
                          );
                        })
                      : [],
                  onChanged: (rawValue) {
                    var splitValue = rawValue?.split(":");
                    var storage = splitValue?[0];
                    var prefixAndName = splitValue?[1].split("/");
                    var prefix = prefixAndName?[0];
                    var name = prefixAndName?[1];
                    var template = state.node?.templates.firstWhere(
                      (element) =>
                          element.storage == storage &&
                          element.prefix == prefix &&
                          element.name == name,
                    );
                    setState(
                      () {
                        deployment = deployment.copyWith(template: template);
                      },
                    );
                  },
                  value: deployment.template != null ? format : null,
                ),
                Text(t.dialogs.deployment.excludes),
                Divider(),
                SingleChildScrollView(
                  child: Column(
                    children: List<Widget>.generate(
                      deployment.excludes.length,
                      (index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              deployment.excludes[index],
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    deployment.excludes.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.delete_forever))
                          ],
                        );
                      },
                    ),
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                Divider(),
                TextField(
                  keyboardType: TextInputType.name,
                  controller: _excludeController,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: t.dialogs.deployment.file_folder,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            deployment.excludes.add(_excludeController.text);
                            _excludeController.clear();
                          });
                        },
                        icon: Icon(Icons.add)),
                  ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.clear,
                          color: Theme.of(context).colorScheme.error),
                    ),
                    IconButton(
                      onPressed: () => save(deployment),
                      icon: Icon(Icons.save),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      );
    },
  );
}

StatefulBuilder addEditString(BuildContext context, NodeState state, bool edit,
    String? c, void Function(String option) save) {
  var option = TextEditingController(text: edit ? c : null);
  return StatefulBuilder(
    builder: (context, setState) {
      return SimpleDialog(
        title: edit
            ? Text("Edit", style: Theme.of(context).textTheme.headline3)
            : Text("Add", style: Theme.of(context).textTheme.headline3),
        children: [
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.name,
                  controller: option,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: "Option",
                  ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.clear,
                          color: Theme.of(context).colorScheme.error),
                    ),
                    IconButton(
                      onPressed: () => save(option.text),
                      icon: Icon(Icons.save),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      );
    },
  );
}
