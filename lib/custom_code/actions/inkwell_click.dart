// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Begin custom widget code

class CustomInkWell extends StatefulWidget {
  const CustomInkWell({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CustomInkWellState createState() => _CustomInkWellState();
}

class _CustomInkWellState extends State<CustomInkWell> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await inkwellClick();
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        color: Colors.blue, // Or any color you want
        // Add more properties to the Container if needed
      ),
    );
  }
}

// Custom action code
Future inkwellClick() async {
  // Add your function code here!
  // This is the code that will be executed when the InkWell is tapped.
}
