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

StatefulBuilder selectGroups(
    BuildContext context, NodeState state, ServiceTask task, void save(ServiceTask task)) {
  return StatefulBuilder(
    builder: (context, setState) => AlertDialog(
      title: Text(t.dialogs.select_groups.title),
      content: Container(
        height: 300,
        width: 300,
        child: ListView.builder(
          itemBuilder: (context, index) =>
              _buildGroupTile(setState ,context, index, state, task),
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

CheckboxListTile _buildGroupTile(StateSetter setState,
    BuildContext context, int index, NodeState state, ServiceTask task) {
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

SimpleDialog addEditInclusion(BuildContext context, bool edit,
    ServiceRemoteInclusion? inclusion, NodeState state) {
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
              controller: null,
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
              controller: null,
              enabled: true,
              decoration: InputDecoration(
                labelText: t.dialogs.inclusions.fields.file_folder,
              ),
            )
          ],
        ),
      )
    ],
  );
}

SimpleDialog addEditDeployment(BuildContext context, bool edit,
    ServiceDeployment? deployment, NodeState state) {
  final format =
      '${deployment?.template?.storage}:${deployment?.template?.prefix}/${deployment?.template?.name}';
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
              onChanged: (value) {},
              value: deployment != null ? format : null,
            ),
            Text(t.dialogs.deployment.excludes),
            Divider(),
            Row(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: List<Widget>.generate(
                      deployment?.excludes.length ?? 0,
                      (index) {
                        return Text(
                          deployment?.excludes[index] ?? '',
                        );
                      },
                    ),
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                )
              ],
            ),
            Divider(),
            TextField(
              keyboardType: TextInputType.name,
              controller: null,
              enabled: true,
              decoration: InputDecoration(
                labelText: t.dialogs.deployment.file_folder,
                suffixIcon: Icon(Icons.add),
              ),
            )
          ],
        ),
      )
    ],
  );
}

List<Widget> _buildGroups(NodeState state, ServiceTask task) {
  return List.generate(state.node?.groups.length ?? 0, (index) {
    final group = state.node?.groups[index];
    return CheckboxListTile(
      value: task.groups?.contains(group?.name ?? ''),
      onChanged: (bool? value) {},
      title: Text(group?.name ?? ''),
    );
  });
}
