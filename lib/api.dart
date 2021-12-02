import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;

const apiKey = '5b2c137c-1f0d-4884-b317-a0f8bef7662a';
const apiUrl = 'https://todoapp-api-pyq5q.ondigitalocean.app';

class Api {
  static Future<List<TodoCheckboxes>> getTodo() async {
    var response = await http.get(Uri.parse('$apiUrl/todos?key=$apiKey'));
    var json = jsonDecode(response.body);

    return json.map<TodoCheckboxes>((data) {
      return TodoCheckboxes.fromJson(data);
    }).toList();
  }

  static Future<List<TodoCheckboxes>> addTodoToList(
      TodoCheckboxes checkbox) async {
    Map<String, dynamic> json = TodoCheckboxes.toJson(checkbox);
    var bodyString = jsonEncode(json);
    var response = await http.post(
      Uri.parse('$apiUrl/todos?key=$apiKey'),
      body: bodyString,
      headers: {'content-type': 'application/json'},
    );
    var list = jsonDecode(response.body);

    return list.map<TodoCheckboxes>((data) {
      return TodoCheckboxes.fromJson(data);
    }).toList();
  }

  static Future deleteTodo(String checkboxId) async {
    var response =
        await http.delete(Uri.parse('$apiUrl/todos/$checkboxId?key=$apiKey'));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<TodoCheckboxes>((data) {
      return TodoCheckboxes.fromJson(data);
    }).toList();
  }

  static Future<List<TodoCheckboxes>> updateTodo(
      TodoCheckboxes checkbox, checkboxId) async {
    Map<String, dynamic> json = TodoCheckboxes.toJson(checkbox);
    var bodyString = jsonEncode(json);
    var response = await http.put(
      Uri.parse('$apiUrl/todos/$checkboxId?key=$apiKey'),
      body: bodyString,
      headers: {'Content-type': 'application/json'},
    );
    var list = jsonDecode(response.body);

    return list.map<TodoCheckboxes>((data) {
      return TodoCheckboxes.fromJson(data);
    }).toList();
  }
}
