import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_view.dart';
import 'model.dart';
import 'todo_list.dart';

void main() {
  var state = MyState();
  state.getTodo();
  runApp(
      ChangeNotifierProvider(create: (context) => state, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIG169 TODO',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'TIG169 TODO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
