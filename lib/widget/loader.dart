import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black.withOpacity(0.3),
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          backgroundColor: Colors.blue,
          valueColor: AlwaysStoppedAnimation<Color>(
            Color(0xFF707070),
          ),
        ),
      ),
    );
  }
}