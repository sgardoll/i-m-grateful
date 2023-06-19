import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomStyleModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldCustomStyle widget.
  TextEditingController? textFieldCustomStyleController;
  String? Function(BuildContext, String?)?
      textFieldCustomStyleControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldCustomStyleController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
