

import 'package:flutter/material.dart';

class settings_screen extends StatelessWidget {
  const settings_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "setting",
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}