import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class SecondScreen extends StatefulWidget {
  final String value;

  const SecondScreen({Key? key, required this.value}) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    return SecondScreenState();
  }
}

class SecondScreenState extends State<SecondScreen> {
  String text = '';
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Second Screen",),

      ),
      body: Column(
        children: [
          Text(text),
          NumericKeyboard(
              onKeyboardTap: _onKeyboardTap,
              textColor: Colors.red,
              rightButtonFn: () {
                setState(() {
                  text = text.substring(0, text.length - 1);
                });
              },
              rightIcon: Icon(Icons.backspace, color: Colors.red,),
              leftButtonFn: () {
                print('left button clicked');
              },
              leftIcon: Icon(Icons.check, color: Colors.red,),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly
          ),
        ],

      )
    );

  }

  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });

}}
