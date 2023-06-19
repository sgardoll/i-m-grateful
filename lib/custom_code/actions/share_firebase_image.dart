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

import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

Future shareFirebaseImage(String firebaseImage, String itemText) async {
  final imageurl = firebaseImage;
  final uri = Uri.parse(imageurl);
  final response = await http.get(uri);
  final bytes = response.bodyBytes;
  final temp = await getTemporaryDirectory();
  final path = '${temp.path}/image.jpg';

  final file = File(path);
  file.writeAsBytesSync(bytes);

  await Share.shareFiles([path], text: '${itemText}');

  // Delete the file after sharing
  await file.delete();
}
