import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'add_view.dart';
import 'model.dart';
import 'todo_list.dart';

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          PopupMenuButton(
              onSelected: (String value) => {
                    Provider.of<MyState>(context, listen: false)
                        .setFilterBy(value)
                  },
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('Done'), value: 'Done'),
                    PopupMenuItem(child: Text('Undone'), value: 'Undone'),
                    PopupMenuItem(child: Text('All'), value: 'All'),
                  ]),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) =>
            TodoList(_filterList(state.list, state.filterBy)),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var newTodoTitle = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddView(TodoCheckboxes(
                          title: '',
                          id: '',
                        ))));
            if (newTodoTitle != null) {
              Provider.of<MyState>(context, listen: false)
                  .addTodo(newTodoTitle);
            }
          }),
    );
  }

  List<TodoCheckboxes> _filterList(list, filterBy) {
    if (filterBy == "Done") {
      return list.where((checkbox) => checkbox.done == true).toList();
    }
    if (filterBy == "Undone") {
      return list.where((checkbox) => checkbox.done == false).toList();
    }
    return list;
  }
}
