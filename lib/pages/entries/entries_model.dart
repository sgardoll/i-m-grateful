import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/more_dropdown/more_dropdown_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/timer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class EntriesModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> itemText = [];
  void addToItemText(String item) => itemText.add(item);
  void removeFromItemText(String item) => itemText.remove(item);
  void removeAtIndexFromItemText(int index) => itemText.removeAt(index);
  void updateItemTextAtIndex(int index, Function(String) updateFn) =>
      itemText[index] = updateFn(itemText[index]);

  List<DocumentReference> itemRefs = [];
  void addToItemRefs(DocumentReference item) => itemRefs.add(item);
  void removeFromItemRefs(DocumentReference item) => itemRefs.remove(item);
  void removeAtIndexFromItemRefs(int index) => itemRefs.removeAt(index);
  void updateItemRefsAtIndex(int index, Function(DocumentReference) updateFn) =>
      itemRefs[index] = updateFn(itemRefs[index]);

  bool showGridView = false;

  ///  State fields for stateful widgets in this page.

  // Model for NavBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
