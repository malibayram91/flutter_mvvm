import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget(this.msg, {Key? key}) : super(key: key);
  final String msg;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(msg));
  }
}
