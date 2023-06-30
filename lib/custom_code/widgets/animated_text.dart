// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({
    Key? key,
    this.width,
    this.height,
    this.text,
    this.fontSize = 32.0,
    this.colour = Colors.white,
    this.fontFamily = 'Aldo',
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? text;
  final double fontSize;
  final Color colour;
  final String fontFamily;

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  double calculateFontSize(String? text) {
    if (text == null) return widget.fontSize;
    List<String> words = text.split(' ');
    if (words.length <= 2) {
      int length = words[0].length;
      if (length == 6) return 72;
      if (length == 7) return 71;
      if (length == 8) return 70;
      if (length == 9) return 68;
      if (length == 10) return 68;
      if (length == 11) return 66;
      if (length == 12) return 64;
    }
    return widget.fontSize;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Center(
        child: TyperAnimatedTextKit(
          text: [widget.text ?? ''],
          textStyle: TextStyle(
            fontFamily: widget.fontFamily,
            letterSpacing: 0.0,
            color: widget.colour,
            fontSize: calculateFontSize(widget.text),
            fontWeight: FontWeight.bold,
            height: 0.8, // Hard-coded line spacing value
          ),
          speed: const Duration(milliseconds: 150),
          isRepeatingAnimation: false,
        ),
      ),
    );
  }
}
