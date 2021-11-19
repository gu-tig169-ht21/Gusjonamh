import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckBoxState {
  final String title;
  bool value;

  CheckBoxState({
    required this.title,
    this.value = false,
  });
}

class MyState extends ChangeNotifier {
  final List<CheckBoxState> _list = [
    CheckBoxState(title: 'Write a book'),
    CheckBoxState(title: 'Do homework'),
    CheckBoxState(title: 'Tidy room'),
    CheckBoxState(title: 'Write a poem'),
  ];

  List<CheckBoxState> get list => _list;

  void checkboxValue(CheckBoxState checkbox, bool value) {
    checkbox.value = !checkbox.value;
    notifyListeners();
  }

  void removeTodo(CheckBoxState checkbox) {
    _list.remove(checkbox);
    notifyListeners();
  }
}
