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

import 'package:image_watermark/image_watermark.dart'; // Import the image_watermark package
import 'dart:io'; // Import dart:io to work with files
import 'package:path_provider/path_provider.dart'; // Import path_provider to get directory paths

Future<String> addWatermark(String imagePath, String watermarkText, int dstX,
    int dstY, Color color) async {
  // Load the image
  final image = File(imagePath);
  final imgBytes = await image.readAsBytes();

  // Get the application documents directory
  final directory = await getApplicationDocumentsDirectory();

  // Define the output file path
  final outputFile = File('${directory.path}/watermarked_image.jpg');

  // Add the watermark to the image
  final watermarkedImgBytes = await ImageWatermark.addTextWatermark(
    imgBytes: imgBytes,
    watermarkText: watermarkText,
    color: color,
    //rotate: rotate,
    //background: background,
    dstX: dstX, // Position of the watermark from the left
    dstY: dstY, // Position of the watermark from the top
  );

  // Write the watermarked image to the output file
  await outputFile.writeAsBytes(watermarkedImgBytes);

  // Return the path of the watermarked image
  return outputFile.path;
}
