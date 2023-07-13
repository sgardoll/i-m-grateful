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
import 'new_item_model.dart';
export 'new_item_model.dart';

class NewItemWidget extends StatefulWidget {
  const NewItemWidget({Key? key}) : super(key: key);

  @override
  _NewItemWidgetState createState() => _NewItemWidgetState();
}

class _NewItemWidgetState extends State<NewItemWidget>
    with TickerProviderStateMixin {
  late NewItemModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'checkAnimationOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'checkAnimationOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewItemModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'NewItem'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NEW_ITEM_PAGE_NewItem_ON_INIT_STATE');
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      logFirebaseEvent('NewItem_update_widget_state');
      setState(() {
        _model.timestamp = getCurrentTimestamp;
      });
      if (currentUserDocument!.settings.locationEnabledByDefault) {
        logFirebaseEvent('NewItem_update_widget_state');
        setState(() {
          _model.addLocation = currentUserLocationValue;
        });
      }
    });

    _model.itemTextController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 8.0, 16.0),
                    child: Text(
                      'I\'M GRATEFUL FOR...',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Raleway',
                            color: valueOrDefault<Color>(
                              FFAppState().primary,
                              FlutterFlowTheme.of(context).primaryText,
                            ),
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Material(
                            color: Colors.transparent,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Visibility(
                                visible: valueOrDefault<bool>(
                                  FFAppState().stt == null ||
                                      FFAppState().stt == '',
                                  true,
                                ),
                                child: TextFormField(
                                  controller: _model.itemTextController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.itemTextController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Write it here',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 22.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                  maxLines: 3,
                                  validator: _model.itemTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Stack(
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'NEW_ITEM_PAGE_Image_ON_TAP');
                                  if (valueOrDefault<bool>(
                                    _model.uploadedFileUrl1 != null &&
                                        _model.uploadedFileUrl1 != '',
                                    false,
                                  )) {
                                    logFirebaseEvent(
                                        'Image_clear_uploaded_data');
                                    setState(() {
                                      _model.isDataUploading1 = false;
                                      _model.uploadedLocalFile1 =
                                          FFUploadedFile(
                                              bytes: Uint8List.fromList([]));
                                      _model.uploadedFileUrl1 = '';
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'Image_upload_media_to_firebase');
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      maxWidth: 512.00,
                                      maxHeight: 1024.00,
                                      imageQuality: 90,
                                      allowPhoto: true,
                                      includeDimensions: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      textColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      pickerFontFamily: 'Outfit',
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isDataUploading1 = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        showUploadMessage(
                                          context,
                                          'Uploading file...',
                                          showLoading: true,
                                        );
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        _model.isDataUploading1 = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile1 =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl1 =
                                              downloadUrls.first;
                                        });
                                        showUploadMessage(context, 'Success!');
                                      } else {
                                        setState(() {});
                                        showUploadMessage(
                                            context, 'Failed to upload data');
                                        return;
                                      }
                                    }
                                  }
                                },
                                text: valueOrDefault<String>(
                                  _model.uploadedFileUrl1 != null &&
                                          _model.uploadedFileUrl1 != ''
                                      ? 'Remove'
                                      : 'Image',
                                  'Image',
                                ),
                                icon: Icon(
                                  Icons.insert_photo_rounded,
                                  color: valueOrDefault<Color>(
                                    () {
                                      if (_model.uploadedFileUrl1 != null &&
                                          _model.uploadedFileUrl1 != '') {
                                        return FlutterFlowTheme.of(context)
                                            .tertiary;
                                      } else if (_model.isDataUploading1) {
                                        return Colors.transparent;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .primaryText;
                                      }
                                    }(),
                                    FlutterFlowTheme.of(context).primaryText,
                                  ),
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: valueOrDefault<Color>(
                                          _model.uploadedFileUrl1 != null &&
                                                  _model.uploadedFileUrl1 != ''
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: valueOrDefault<bool>(
                                      _model.uploadedFileUrl1 != null &&
                                          _model.uploadedFileUrl1 != '',
                                      false,
                                    )
                                        ? FlutterFlowTheme.of(context).tertiary
                                        : Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                showLoadingIndicator: false,
                              ),
                              if (_model.isDataUploading1)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 4.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.checkAnimationModel1,
                                      updateCallback: () => setState(() {}),
                                      child: CheckAnimationWidget(),
                                    ).animateOnPageLoad(animationsMap[
                                        'checkAnimationOnPageLoadAnimation1']!),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Stack(
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'NEW_ITEM_PAGE_Selfie_ON_TAP');
                                  if (valueOrDefault<bool>(
                                    _model.uploadedFileUrl2 != null &&
                                        _model.uploadedFileUrl2 != '',
                                    false,
                                  )) {
                                    logFirebaseEvent(
                                        'Selfie_clear_uploaded_data');
                                    setState(() {
                                      _model.isDataUploading2 = false;
                                      _model.uploadedLocalFile2 =
                                          FFUploadedFile(
                                              bytes: Uint8List.fromList([]));
                                      _model.uploadedFileUrl2 = '';
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'Selfie_upload_media_to_firebase');
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      maxWidth: 512.00,
                                      maxHeight: 1024.00,
                                      imageQuality: 90,
                                      allowPhoto: true,
                                      includeDimensions: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      textColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      pickerFontFamily: 'Outfit',
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isDataUploading2 = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        showUploadMessage(
                                          context,
                                          'Uploading file...',
                                          showLoading: true,
                                        );
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        _model.isDataUploading2 = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile2 =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl2 =
                                              downloadUrls.first;
                                        });
                                        showUploadMessage(context, 'Success!');
                                      } else {
                                        setState(() {});
                                        showUploadMessage(
                                            context, 'Failed to upload data');
                                        return;
                                      }
                                    }
                                  }
                                },
                                text: valueOrDefault<String>(
                                  _model.uploadedFileUrl2 != null &&
                                          _model.uploadedFileUrl2 != ''
                                      ? 'Remove'
                                      : 'Selfie',
                                  'Selfie',
                                ),
                                icon: Icon(
                                  Icons.face_retouching_natural,
                                  color: valueOrDefault<Color>(
                                    () {
                                      if (_model.uploadedFileUrl2 != null &&
                                          _model.uploadedFileUrl2 != '') {
                                        return FlutterFlowTheme.of(context)
                                            .tertiary;
                                      } else if (_model.isDataUploading2) {
                                        return Colors.transparent;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .primaryText;
                                      }
                                    }(),
                                    FlutterFlowTheme.of(context).primaryText,
                                  ),
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: valueOrDefault<Color>(
                                          _model.uploadedFileUrl2 != null &&
                                                  _model.uploadedFileUrl2 != ''
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: valueOrDefault<bool>(
                                      _model.uploadedFileUrl2 != null &&
                                          _model.uploadedFileUrl2 != '',
                                      false,
                                    )
                                        ? FlutterFlowTheme.of(context).tertiary
                                        : Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                showLoadingIndicator: false,
                              ),
                              if (_model.isDataUploading2)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 4.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.checkAnimationModel2,
                                      updateCallback: () => setState(() {}),
                                      child: CheckAnimationWidget(),
                                    ).animateOnPageLoad(animationsMap[
                                        'checkAnimationOnPageLoadAnimation2']!),
                                  ),
                                ),
                            ],
                          ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'NEW_ITEM_PAGE_Locationbutton_ON_TAP');
                            currentUserLocationValue =
                                await getCurrentUserLocation(
                                    defaultLocation: LatLng(0.0, 0.0));
                            if (_model.addLocation != null) {
                              logFirebaseEvent(
                                  'Locationbutton_update_widget_state');
                              setState(() {
                                _model.addLocation = null;
                              });
                            } else {
                              logFirebaseEvent(
                                  'Locationbutton_update_widget_state');
                              setState(() {
                                _model.addLocation = currentUserLocationValue;
                              });
                            }
                          },
                          text: valueOrDefault<String>(
                            _model.addLocation != null ? 'Remove' : 'Location',
                            'Location',
                          ),
                          icon: Icon(
                            Icons.location_on,
                            color: valueOrDefault<Color>(
                              _model.addLocation != null
                                  ? FlutterFlowTheme.of(context).tertiary
                                  : FlutterFlowTheme.of(context).primaryText,
                              FlutterFlowTheme.of(context).primaryText,
                            ),
                            size: 20.0,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  color: valueOrDefault<Color>(
                                    valueOrDefault<bool>(
                                      _model.addLocation != null,
                                      false,
                                    )
                                        ? FlutterFlowTheme.of(context).tertiary
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    FlutterFlowTheme.of(context).primaryText,
                                  ),
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: valueOrDefault<bool>(
                                _model.addLocation != null,
                                false,
                              )
                                  ? FlutterFlowTheme.of(context).tertiary
                                  : Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          showLoadingIndicator: false,
                        ),
                      ]
                          .divide(SizedBox(width: 8.0))
                          .addToStart(SizedBox(width: 0.0))
                          .addToEnd(SizedBox(width: 0.0)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: Material(
                color: Colors.transparent,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      width: 3.0,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Current style: ',
                                  textAlign: TextAlign.start,
                                  maxLines: 3,
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    1.0, 0.0, 8.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => AutoSizeText(
                                    valueOrDefault(
                                        currentUserDocument?.style, ''),
                                    textAlign: TextAlign.start,
                                    maxLines: 3,
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: valueOrDefault<Color>(
                                            FFAppState().primary,
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('NEW_ITEM_PAGE_STYLES_BTN_ON_TAP');
                          logFirebaseEvent('Button_bottom_sheet');
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: Color(0x40131619),
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.85,
                                  child: ArtStyleWidget(),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        text: 'Styles',
                        icon: Icon(
                          Icons.format_paint_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Material(
                color: Colors.transparent,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      width: 3.0,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'NEW_ITEM_PAGE_RichText_ithmyr2s_ON_TAP');
                                logFirebaseEvent('RichText_date_time_picker');
                                final _datePicked1Date = await showDatePicker(
                                  context: context,
                                  initialDate: _model.timestamp!,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2050),
                                );

                                TimeOfDay? _datePicked1Time;
                                if (_datePicked1Date != null) {
                                  _datePicked1Time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                        _model.timestamp!),
                                  );
                                }

                                if (_datePicked1Date != null &&
                                    _datePicked1Time != null) {
                                  setState(() {
                                    _model.datePicked1 = DateTime(
                                      _datePicked1Date.year,
                                      _datePicked1Date.month,
                                      _datePicked1Date.day,
                                      _datePicked1Time!.hour,
                                      _datePicked1Time.minute,
                                    );
                                  });
                                }
                                logFirebaseEvent(
                                    'RichText_update_widget_state');
                                setState(() {
                                  _model.timestamp = _model.datePicked1;
                                });
                              },
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: dateTimeFormat(
                                        'MMMEd',
                                        _model.timestamp,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    TextSpan(
                                      text: ', ',
                                      style: GoogleFonts.getFont(
                                        'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    TextSpan(
                                      text: dateTimeFormat(
                                        'jm',
                                        _model.timestamp,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 11.0,
                                      ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('NEW_ITEM_PAGE_DATE_BTN_ON_TAP');
                          logFirebaseEvent('Button_date_time_picker');
                          final _datePicked2Date = await showDatePicker(
                            context: context,
                            initialDate: _model.timestamp!,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2050),
                          );

                          TimeOfDay? _datePicked2Time;
                          if (_datePicked2Date != null) {
                            _datePicked2Time = await showTimePicker(
                              context: context,
                              initialTime:
                                  TimeOfDay.fromDateTime(_model.timestamp!),
                            );
                          }

                          if (_datePicked2Date != null &&
                              _datePicked2Time != null) {
                            setState(() {
                              _model.datePicked2 = DateTime(
                                _datePicked2Date.year,
                                _datePicked2Date.month,
                                _datePicked2Date.day,
                                _datePicked2Time!.hour,
                                _datePicked2Time.minute,
                              );
                            });
                          }
                          logFirebaseEvent('Button_update_widget_state');
                          setState(() {
                            _model.timestamp = _model.datePicked1;
                          });
                        },
                        text: 'Date',
                        icon: Icon(
                          Icons.edit_calendar,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 48.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('NEW_ITEM_PAGE_CANCEL_BTN_ON_TAP');
                        logFirebaseEvent('Button_clear_uploaded_data');
                        setState(() {
                          _model.isDataUploading1 = false;
                          _model.uploadedLocalFile1 =
                              FFUploadedFile(bytes: Uint8List.fromList([]));
                          _model.uploadedFileUrl1 = '';
                        });

                        logFirebaseEvent('Button_clear_uploaded_data');
                        setState(() {
                          _model.isDataUploading2 = false;
                          _model.uploadedLocalFile2 =
                              FFUploadedFile(bytes: Uint8List.fromList([]));
                          _model.uploadedFileUrl2 = '';
                        });

                        // TODO: Delete any Firebase item created
                        logFirebaseEvent('Button_navigate_back');
                        context.safePop();
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        width: 110.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('NEW_ITEM_PAGE_CREATE_BTN_ON_TAP');
                        var _shouldSetState = false;
                        final firestoreBatch =
                            FirebaseFirestore.instance.batch();
                        try {
                          logFirebaseEvent('Button_validate_form');
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          logFirebaseEvent('Button_backend_call');
                          _model.itemTextClean = await BayhouseAPICall.call(
                            authToken: FFAppState().bayhouseAPI,
                            textToCheck: _model.itemTextController.text,
                          );
                          _shouldSetState = true;
                          if ((_model.itemTextClean?.succeeded ?? true)) {
                            logFirebaseEvent('Button_backend_call');

                            var itemRecordReference =
                                ItemRecord.collection.doc();
                            firestoreBatch.set(
                                itemRecordReference,
                                createItemRecordData(
                                  itemText: BayhouseAPICall.cleanText(
                                    (_model.itemTextClean?.jsonBody ?? ''),
                                  ).toString(),
                                  timestamp: getCurrentTimestamp,
                                  userRef: currentUserReference,
                                  gender: valueOrDefault(
                                      currentUserDocument?.gender, ''),
                                  style: valueOrDefault(
                                      currentUserDocument?.style, ''),
                                ));
                            _model.createItemWithText =
                                ItemRecord.getDocumentFromData(
                                    createItemRecordData(
                                      itemText: BayhouseAPICall.cleanText(
                                        (_model.itemTextClean?.jsonBody ?? ''),
                                      ).toString(),
                                      timestamp: getCurrentTimestamp,
                                      userRef: currentUserReference,
                                      gender: valueOrDefault(
                                          currentUserDocument?.gender, ''),
                                      style: valueOrDefault(
                                          currentUserDocument?.style, ''),
                                    ),
                                    itemRecordReference);
                            _shouldSetState = true;
                            logFirebaseEvent('Button_backend_call');

                            firestoreBatch.update(
                                _model.createItemWithText!.reference,
                                createItemRecordData(
                                  location: _model.addLocation == null
                                      ? null
                                      : _model.addLocation,
                                  timestamp: getCurrentTimestamp,
                                  uploadedImages: createUploadedImageUrlsStruct(
                                    image: _model.uploadedFileUrl1,
                                    selfie: _model.uploadedFileUrl2,
                                    clearUnsetFields: false,
                                  ),
                                ));
                          } else {
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Your text did not pass the profanity text correctly',
                                  style: GoogleFonts.getFont(
                                    'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('Entries');
                        } finally {
                          await firestoreBatch.commit();
                        }

                        if (_shouldSetState) setState(() {});
                      },
                      text: 'Create',
                      options: FFButtonOptions(
                        width: 200.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FFAppState().primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.bold,
                            ),
                        elevation: 6.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
