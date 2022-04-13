import 'package:flutter/material.dart';


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

        ],

      )
    );

  }

}
