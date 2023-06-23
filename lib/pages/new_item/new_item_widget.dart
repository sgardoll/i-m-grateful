import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/art_style_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

class _NewItemWidgetState extends State<NewItemWidget> {
  late NewItemModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

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
                      'I\'M GRATEFUL',
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: Text(
                      'FOR...',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Raleway',
                            color: valueOrDefault<Color>(
                              FFAppState().lightVibrant,
                              FlutterFlowTheme.of(context).primaryText,
                            ),
                            fontSize: 24.0,
                            fontWeight: FontWeight.normal,
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
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (valueOrDefault<bool>(
                          FFAppState().stt == null || FFAppState().stt == '',
                          true,
                        ))
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
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
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (valueOrDefault<bool>(
                          _model.uploadedFileUrl1 == null ||
                              _model.uploadedFileUrl1 == '',
                          true,
                        ))
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'NEW_ITEM_PAGE_IMAGE_BTN_ON_TAP');
                              logFirebaseEvent(
                                  'Button_upload_media_to_firebase');
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                maxWidth: 512.00,
                                imageQuality: 90,
                                allowPhoto: true,
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                pickerFontFamily: 'Outfit',
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => _model.isDataUploading1 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];
                                var downloadUrls = <String>[];
                                try {
                                  showUploadMessage(
                                    context,
                                    'Uploading file...',
                                    showLoading: true,
                                  );
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
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
                            },
                            text: 'Image',
                            icon: Icon(
                              Icons.add_photo_alternate,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        if (valueOrDefault<bool>(
                          _model.uploadedFileUrl1 != null &&
                              _model.uploadedFileUrl1 != '',
                          false,
                        ))
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'NEW_ITEM_PAGE_IMAGE_BTN_ON_TAP');
                              logFirebaseEvent('Button_clear_uploaded_data');
                              setState(() {
                                _model.isDataUploading1 = false;
                                _model.uploadedLocalFile1 = FFUploadedFile(
                                    bytes: Uint8List.fromList([]));
                                _model.uploadedFileUrl1 = '';
                              });
                            },
                            text: 'Image',
                            icon: Icon(
                              Icons.hide_image_outlined,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: valueOrDefault<Color>(
                                FFAppState().primary,
                                FlutterFlowTheme.of(context).primary,
                              ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        if (valueOrDefault<bool>(
                          _model.uploadedFileUrl2 == null ||
                              _model.uploadedFileUrl2 == '',
                          true,
                        ))
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'NEW_ITEM_PAGE_SELFIE_BTN_ON_TAP');
                              logFirebaseEvent(
                                  'Button_upload_media_to_firebase');
                              final selectedMedia = await selectMedia(
                                maxWidth: 512.00,
                                imageQuality: 90,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => _model.isDataUploading2 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];
                                var downloadUrls = <String>[];
                                try {
                                  showUploadMessage(
                                    context,
                                    'Uploading file...',
                                    showLoading: true,
                                  );
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
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
                            },
                            text: 'Selfie',
                            icon: Icon(
                              Icons.add_reaction,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        if (valueOrDefault<bool>(
                          _model.uploadedFileUrl2 != null &&
                              _model.uploadedFileUrl2 != '',
                          false,
                        ))
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'NEW_ITEM_PAGE_SELFIE_BTN_ON_TAP');
                              logFirebaseEvent('Button_clear_uploaded_data');
                              setState(() {
                                _model.isDataUploading2 = false;
                                _model.uploadedLocalFile2 = FFUploadedFile(
                                    bytes: Uint8List.fromList([]));
                                _model.uploadedFileUrl2 = '';
                              });
                            },
                            text: 'Selfie',
                            icon: Icon(
                              Icons.face_retouching_off_rounded,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: valueOrDefault<Color>(
                                FFAppState().primary,
                                FlutterFlowTheme.of(context).primary,
                              ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        if (valueOrDefault<bool>(
                          _model.addLocation == null,
                          true,
                        ))
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'NEW_ITEM_PAGE_LOCATION_BTN_ON_TAP');
                              currentUserLocationValue =
                                  await getCurrentUserLocation(
                                      defaultLocation: LatLng(0.0, 0.0));
                              logFirebaseEvent('Button_update_widget_state');
                              setState(() {
                                _model.addLocation = currentUserLocationValue;
                              });
                            },
                            text: 'Location',
                            icon: Icon(
                              Icons.add_location,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        if (valueOrDefault<bool>(
                          _model.addLocation != null,
                          false,
                        ))
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'NEW_ITEM_PAGE_LOCATION_BTN_ON_TAP');
                              logFirebaseEvent('Button_update_widget_state');
                              setState(() {
                                _model.addLocation = null;
                              });
                            },
                            text: 'Location',
                            icon: Icon(
                              Icons.location_off_rounded,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: valueOrDefault<Color>(
                                FFAppState().primary,
                                FlutterFlowTheme.of(context).primary,
                              ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Text(
                          'Current style: ',
                          textAlign: TextAlign.start,
                          maxLines: 6,
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Outfit',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              valueOrDefault(currentUserDocument?.style, ''),
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FFAppState().primary,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('NEW_ITEM_PAGE_CHANGE_STYLE_BTN_ON_TAP');
                      logFirebaseEvent('Button_bottom_sheet');
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.85,
                              child: ArtStyleWidget(),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    text: 'Change Style',
                    icon: Icon(
                      Icons.format_paint_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: Icon(
                        Icons.today_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'NEW_ITEM_PAGE_RichText_ithmyr2s_ON_TAP');
                          logFirebaseEvent('RichText_date_time_picker');
                          final _datePickedDate = await showDatePicker(
                            context: context,
                            initialDate: _model.timestamp!,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2050),
                          );

                          TimeOfDay? _datePickedTime;
                          if (_datePickedDate != null) {
                            _datePickedTime = await showTimePicker(
                              context: context,
                              initialTime:
                                  TimeOfDay.fromDateTime(_model.timestamp!),
                            );
                          }

                          if (_datePickedDate != null &&
                              _datePickedTime != null) {
                            setState(() {
                              _model.datePicked = DateTime(
                                _datePickedDate.year,
                                _datePickedDate.month,
                                _datePickedDate.day,
                                _datePickedTime!.hour,
                                _datePickedTime.minute,
                              );
                            });
                          }
                          logFirebaseEvent('RichText_update_widget_state');
                          setState(() {
                            _model.timestamp = _model.datePicked;
                          });
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: dateTimeFormat(
                                  'MMMEd',
                                  _model.timestamp,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              TextSpan(
                                text: dateTimeFormat(
                                  'jm',
                                  _model.timestamp,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
