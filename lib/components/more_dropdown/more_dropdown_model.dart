import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/feedback_dropdown/feedback_dropdown_widget.dart';
import '/components/image_selfie/image_selfie_widget.dart';
import '/components/location/location_widget.dart';
import '/components/small_infinity_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MoreDropdownModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String? itemText;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in regenerate widget.
  FeedbackRecord? addRegenerateAsFeedback;
  // Model for SmallInfinity component.
  late SmallInfinityModel smallInfinityModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    smallInfinityModel = createModel(context, () => SmallInfinityModel());
  }

  void dispose() {
    smallInfinityModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
