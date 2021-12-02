import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';
import 'todolist_view.dart';

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
