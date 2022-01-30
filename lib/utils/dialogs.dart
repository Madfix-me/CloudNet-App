import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_deployment.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_task.dart';
import 'package:cloudnet/state/node_state.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:cloudnet/i18n/strings.g.dart';

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

AlertDialog selectGroups(
    BuildContext context, NodeState state, ServiceTask task) {
  return AlertDialog(
    title: Text('Select groups for this task'),
    content: SingleChildScrollView(
      child: Column(
        children: _buildGroups(state, task),
      ),
    ),
  );
}

SimpleDialog addEditDeployment(BuildContext context, bool edit,
    ServiceDeployment? deployment, NodeState state) {
  final format =
      '${deployment?.template?.storage}:${deployment?.template?.prefix}/${deployment?.template?.name}';
  return SimpleDialog(
    title: edit
        ? Text('Edit deployment', style: Theme.of(context).textTheme.headline3)
        : Text('Add deployment', style: Theme.of(context).textTheme.headline3),
    children: [
      Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              items: state.node?.templates.isNotEmpty == true ? List<DropdownMenuItem<String>>.generate(
                  state.node?.templates.length ?? 0,
                  (index) {
                    final template = state.node?.templates[index];
                    final format =
                        '${template?.storage}:${template?.prefix}/${template?.name}';
                    return DropdownMenuItem(
                      child: Text(format),
                      value: format,
                    );
                  }) : [],
              onChanged: (value) {},
              value: deployment != null ? format : null,
            ),
            Text('Excludes'),
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
                labelText: 'File/Folder',
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
