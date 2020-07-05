import 'package:flutter/material.dart';

class VegScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(strokeWidth: 2),
      ],
    );
  }
}
