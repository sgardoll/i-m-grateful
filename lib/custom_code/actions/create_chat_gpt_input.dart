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

Future<String> createChatGptInput(
  String itemText,
  String? moreText,
  LatLng? location,
  String? style,
) async {
  String introText =
      "You are a futuristic AI analyst, tasked with understanding the remnants of humanity long after its extinction. Your current assignment involves classifying and contextualizing reflections from humans from 2023. Let's dive in.";

  String diaryEntry = 'The entry reads, "$itemText"';
  if (moreText != null) {
    diaryEntry += '. They also write "$moreText"';
  }
  if (location != null) {
    diaryEntry +=
        '. A location reference is included and should carry some weight in your assessment: $location';
  }
  diaryEntry += ". ";

  String analysisInstructions =
      "Your task is to classify the diary entry based on the following categories: safety ('safe' or 'unsafe' depending on if the content is pornographic or violent), sentiment ('positive' or 'negative'), object (if a specific object is mentioned), and theme (the overall concept discussed). Additionally, identify human concepts that are similar to the ones described in the entry. Please provide your analysis in the following JSON format: {\"safety\": \"\", \"sentiment\": \"\", \"object\": \"\", \"theme\": \"\", \"similarToObject\": \"\", \"similarToTheme\": \"\"}. All fields must have a value and be as descriptive as possible.";

  String artInstructions = style != null
      ? 'As a final task, look for examples throughout humanity where "$itemText" appears in the $style art style or movement. If no direct references can be found, provide the closest you can find. Provide this in JSON format: {\"artReferences\": \"\"}.'
      : "";

  String output =
      '$introText $diaryEntry $analysisInstructions $artInstructions';

  return output;
}
