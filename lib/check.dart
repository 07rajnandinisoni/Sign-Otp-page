import 'package:flutter/material.dart';
class check extends StatefulWidget {
  check({Key? key}) : super(key: key);

  @override
  State<check> createState() => _checkState();
}
class _checkState extends State<check> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("OTP checked")),
    );
  }
}