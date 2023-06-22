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

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:dio/dio.dart';

Future savePhoto(String imageUrl) async {
  var response = await Dio()
      .get(imageUrl, options: Options(responseType: ResponseType.bytes));
  final result = await ImageGallerySaver.saveImage(
    Uint8List.fromList(response.data),
  );
  print(result);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
