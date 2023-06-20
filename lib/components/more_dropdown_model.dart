import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/feedback_dropdown/feedback_dropdown_widget.dart';
import '/components/image_selfie_widget.dart';
import '/components/location_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MoreDropdownModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String? itemText;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in replaceWidget widget.
  FeedbackRecord? addRegenerateAsFeedback;
  // Stores action output result for [Custom Action - addWatermark] action in replaceWidget widget.
  String? addWatermark;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
