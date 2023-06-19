import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/art_style_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/pages_sub/upload_photo/upload_photo_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditItemModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool addMore = false;

  bool? addPhoto = false;

  LatLng? addLocation;

  DateTime? timestamp;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for itemText widget.
  TextEditingController? itemTextController;
  String? Function(BuildContext, String?)? itemTextControllerValidator;
  // Stores action output result for [Bottom Sheet - UploadPhoto] action in IconButton widget.
  UploadedImageUrlsStruct? uploadPhotoBottomSheet;
  // Stores action output result for [Bottom Sheet - UploadPhoto] action in IconButton widget.
  UploadedImageUrlsStruct? uploadPhotoBottomSheetCopy;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (BayhouseAPI)] action in Button widget.
  ApiCallResponse? itemTextClean;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    itemTextController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
