import 'package:flutter/material.dart';
import './secondView.dart';

void main() {
  runApp(const MyApp());
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
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(height: 20),
            _checkbox('Write a book'),
            _divide(),
            _checkbox('Do homework'),
            _divide(),
            _checkedcheckbox('Tidy room'),
            _divide(),
            _checkbox('Watch TV'),
            _divide(),
            _checkbox('Nap'),
            _divide(),
            _checkbox('Shop groceries'),
            _divide(),
            _checkbox('Have fun'),
            _divide(),
            _checkbox('Meditate'),
            _divide(),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(child: const Icon(Icons.add), onPressed: () {}),
    );
  }

  Widget _checkbox(String text) {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (val) {},
        ),
        Text(text, style: const TextStyle(fontSize: 21)),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.clear)),
      ],
    );
  }

  Widget _checkedcheckbox(String text) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (val) {},
        ),
        Text(text,
            style: const TextStyle(
                decoration: TextDecoration.lineThrough, fontSize: 21)),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.clear)),
      ],
    );
  }

  Widget _divide() {
    return const Divider(
      height: 15,
      thickness: 1,
    );
  }
}
