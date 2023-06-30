import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TimerModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  InstantTimer? TwoMinTimer;
  // Stores action output result for [Firestore Query - Query a collection] action in timer widget.
  List<ItemRecord>? queryFirebase;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    TwoMinTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
