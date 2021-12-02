import 'package:flutter/material.dart';
import 'api.dart';

class TodoCheckboxes {
  String id;
  String title;
  bool done;

  TodoCheckboxes({
    required this.id,
    required this.title,
    this.done = false,
  });

  static Map<String, dynamic> toJson(TodoCheckboxes checkboxes) {
    return {
      'title': checkboxes.title,
      'done': checkboxes.done,
    };
  }

  static TodoCheckboxes fromJson(Map<String, dynamic> json) {
    return TodoCheckboxes(
      id: json['id'],
      title: json['title'],
      done: json['done'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<TodoCheckboxes> _list = [];

  String _filterBy = 'All';
  String get filterBy => _filterBy;

  List<TodoCheckboxes> get list => _list;

  Future getTodo() async {
    List<TodoCheckboxes> list = await Api.getTodo();
    _list = list;
    notifyListeners();
  }

  void checkboxValue(TodoCheckboxes checkbox, bool done) {
    checkbox.done = !checkbox.done;
    notifyListeners();
  }

  void removeTodo(TodoCheckboxes checkbox) async {
    _list = await Api.deleteTodo(checkbox.id);
    notifyListeners();
  }

  void addTodo(TodoCheckboxes checkbox) async {
    _list = await Api.addTodoToList(checkbox);
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }

  void changeTodo(TodoCheckboxes checkbox, bool done) async {
    checkbox.done = !checkbox.done;
    _list = await Api.updateTodo(checkbox, checkbox.id);
    notifyListeners();
  }
}
