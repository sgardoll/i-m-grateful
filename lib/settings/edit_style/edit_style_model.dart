import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_style/custom_style_widget.dart';
import '/components/small_infinity_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditStyleModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? customArtStyle;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CustomStylesRecord? createCustomArtStyle;
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
