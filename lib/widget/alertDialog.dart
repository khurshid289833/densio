import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final content;
  CustomAlertDialog({required this.content});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(content,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600)),
      ),
      actions: [
        TextButton(
          child: Text("OK",style: TextStyle(color: Colors.blue)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
