import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class TodoList extends StatelessWidget {
  final List<CheckBoxState> list;
  TodoList(this.list);
  Widget build(BuildContext context) {
    return ListView(
        children: list
            .map((checkbox) => buildSinglecheckbox(checkbox, context))
            .toList());
  }

  Widget buildSinglecheckbox(CheckBoxState checkbox, context) =>
      CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: checkbox.value,
        title: Text(checkbox.title,
            style: TextStyle(
                fontSize: 20,
                decoration:
                    checkbox.value ? TextDecoration.lineThrough : null)),
        onChanged: (value) {
          var state = Provider.of<MyState>(context, listen: false);
          state.checkboxValue(checkbox, false);
        },
        secondary: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            var state = Provider.of<MyState>(context, listen: false);
            state.removeTodo(checkbox);
          },
        ),
      );
}
