import '/flutter_flow/flutter_flow_rive_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckAnimationModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RiveAnimation widget.
  final riveAnimationAnimationsList = [
    'Timeline 1',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    riveAnimationAnimationsList.forEach((name) {
      riveAnimationControllers.add(FlutterFlowRiveController(
        name,
      ));
    });
  }

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
