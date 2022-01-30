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
