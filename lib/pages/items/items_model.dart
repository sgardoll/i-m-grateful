import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/item_stack/item_stack_widget.dart';
import '/components/more_dropdown/more_dropdown_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Items widget.
  UsersRecord? queryUser;
  // State field(s) for PageView widget.
  PageController? pageViewController;
  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for AnimatedText.
  late FlutterFlowDynamicModels<ItemStackModel> animatedTextModels;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    animatedTextModels = FlutterFlowDynamicModels(() => ItemStackModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    animatedTextModels.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
