import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double? fontsize(
  double? width,
  String? text,
  double? height,
) {
  if (height == null || width == null || text == null) {
    return null;
  }

  // Calculate the total screen area
  double totalArea = height * width;

  // Calculate a rough estimate of the area each character in the text would occupy
  double textArea = totalArea / text.length.toDouble();

  // As font size is one-dimensional and area is two-dimensional, we take the square root
  // This gives a rough estimate of the size each character would need to be to fit on the screen
  double fontSize = math.sqrt(textArea);

  // Return the font size
  return fontSize;
}

String getImageStringFromPath(String itemImagePath) {
  // take an ImagePath and return a String
  return itemImagePath.substring(itemImagePath.indexOf('/') + 1);
}

List<dynamic> createTextPrompts(
  String text,
  double weight,
) {
//String text = "A beautiful sunset";
//double weight = 0.5;

  return [
    {"text": text, "weight": weight}
  ];
}

int frequencyInDays(String dropdownChoice) {
  switch (dropdownChoice) {
    case 'Every Day':
      return 1;
    case 'Every Week':
      return 7;
    case 'Every Fortnight':
      return 14;
    case 'Mondays':
    case 'Tuesdays':
    case 'Wednesdays':
    case 'Thursdays':
    case 'Fridays':
    case 'Saturdays':
    case 'Sundays':
      return 7;
    default:
      return 0; // return 0 if the input is not recognized
  }
}
