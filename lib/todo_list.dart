import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class TodoList extends StatelessWidget {
  final List<TodoCheckboxes> list;
  TodoList(this.list);
  Widget build(BuildContext context) {
    return ListView(
        children: list
            .map((checkbox) => buildSinglecheckbox(checkbox, context))
            .toList());
  }

  Widget buildSinglecheckbox(TodoCheckboxes checkbox, context) =>
      CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: checkbox.done,
        title: Text(checkbox.title,
            style: TextStyle(
                fontSize: 20,
                decoration: checkbox.done ? TextDecoration.lineThrough : null)),
        onChanged: (value) {
          var state = Provider.of<MyState>(context, listen: false);
          state.changeTodo(checkbox, false);
        },
        secondary: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            Provider.of<MyState>(context, listen: false).removeTodo(checkbox);
          },
        ),
      );
}
