import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/art_style/art_style_widget.dart';
import '/components/check_animation/check_animation_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewItemModel extends FlutterFlowModel {
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
  String? _itemTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 5) {
      return 'Minimum of 5 characters required';
    }

    return null;
  }

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Model for CheckAnimation component.
  late CheckAnimationModel checkAnimationModel1;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Model for CheckAnimation component.
  late CheckAnimationModel checkAnimationModel2;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Backend Call - API (BayhouseAPI)] action in Button widget.
  ApiCallResponse? itemTextClean;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ItemRecord? createItemWithText;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    itemTextControllerValidator = _itemTextControllerValidator;
    checkAnimationModel1 = createModel(context, () => CheckAnimationModel());
    checkAnimationModel2 = createModel(context, () => CheckAnimationModel());
  }

  void dispose() {
    itemTextController?.dispose();
    checkAnimationModel1.dispose();
    checkAnimationModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
