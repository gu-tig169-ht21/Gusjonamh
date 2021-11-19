import 'package:flutter/material.dart';

class SecondView extends StatelessWidget {
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
        child: const TextField(
            decoration: InputDecoration(
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
        onPressed: () {},
        child: const Text(
          '+ ADD',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}
