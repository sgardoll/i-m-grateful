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

import 'dart:async';
import 'package:sensors_plus/sensors_plus.dart';

class ParallaxCard extends StatefulWidget {
  const ParallaxCard({
    Key? key,
    this.width,
    this.height,
    this.foregroundImage,
    this.backgroundImage,
    this.text,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? foregroundImage;
  final String? backgroundImage;
  final String? text;

  @override
  _ParallaxCardState createState() => _ParallaxCardState();
}

class _ParallaxCardState extends State<ParallaxCard> {
  double? accelerometerXAxis;
  StreamSubscription<dynamic>? accelerometerListener;
  late final String foregroundImage;
  late final String backgroundImage;
  late final String text;

  @override
  void initState() {
    super.initState();
    foregroundImage = widget.foregroundImage ??
        'https://raw.githubusercontent.com/sbis04/flutter-parallax-cards/main/images/rio.png';
    backgroundImage = widget.backgroundImage ??
        'https://raw.githubusercontent.com/sbis04/flutter-parallax-cards/main/images/rio-bg.jpg';
    text = widget.text ?? 'Brazil';
    accelerometerListener = accelerometerEvents.listen(
      (AccelerometerEvent event) {
        setState(() {
          accelerometerXAxis = event.x;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    accelerometerListener?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              right: accelerometerXAxis != null
                  ? (-350 + accelerometerXAxis! * 30)
                  : -350,
              child: Image.network(
                backgroundImage,
                fit: BoxFit.fitHeight,
              ),
            ),
            // Foreground Image
            AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              width: 320,
              bottom: -60,
              right: accelerometerXAxis != null
                  ? (-13 + accelerometerXAxis! * 1.5)
                  : -13,
              child: Image.network(
                foregroundImage,
                fit: BoxFit.fill,
              ),
            ),
            // Text (Country name)
            Column(
              children: [
                const SizedBox(height: 60),
                const Text(
                  'FEATURED',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
