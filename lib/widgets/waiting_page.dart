import 'package:flutter/material.dart';

class WaitingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
        body: Center(
        child: CircularProgressIndicator(),
    ),
    );
  }
}
