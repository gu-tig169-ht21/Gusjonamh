import 'package:flutter/material.dart';
import 'package:my_first_app/model.dart';

class AddView extends StatefulWidget {
  final TodoCheckboxes checkbox;
  AddView(this.checkbox);
  @override
  State<StatefulWidget> createState() {
    return AddViewState(checkbox);
  }
}

class AddViewState extends State<AddView> {
  late TextEditingController textEditingController;

  late String title;

  AddViewState(TodoCheckboxes checkbox) {
    this.title = checkbox.title;
    textEditingController = TextEditingController(text: checkbox.title);

    textEditingController.addListener(() {
      setState(() {
        title = textEditingController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('TIG169 TODO'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 20.0,
              ),
              _inputBox(),
              _button(),
            ],
          ),
        ));
  }

  Widget _inputBox() {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(20),
        child: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0)),
              labelText: 'What are you going to do?',
            )));
  }

  Widget _button() {
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
        onPressed: () {
          Navigator.pop(context, TodoCheckboxes(title: title, id: ''));
        },
        child: const Text(
          '+ ADD',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}
