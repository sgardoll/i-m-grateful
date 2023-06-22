import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/feedback_dropdown/feedback_dropdown_widget.dart';
import '/components/image_selfie_widget.dart';
import '/components/location_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'more_dropdown_model.dart';
export 'more_dropdown_model.dart';

class MoreDropdownWidget extends StatefulWidget {
  const MoreDropdownWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemRecord? item;

  @override
  _MoreDropdownWidgetState createState() => _MoreDropdownWidgetState();
}

class _MoreDropdownWidgetState extends State<MoreDropdownWidget>
    with TickerProviderStateMixin {
  late MoreDropdownModel _model;

  final animationsMap = {
    'rowOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.7),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'rowOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.7),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'rowOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.7),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'rowOnActionTriggerAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.7),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'rowOnActionTriggerAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.7),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.7),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'rowOnActionTriggerAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.7),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'rowOnActionTriggerAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.7),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'rowOnActionTriggerAnimation8': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.7),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoreDropdownModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 48.0, 16.0, 16.0),
      child: Container(
        width: 208.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MORE_DROPDOWN_COMP_feedback_ON_TAP');
                  logFirebaseEvent('feedback_widget_animation');
                  if (animationsMap['rowOnActionTriggerAnimation8'] != null) {
                    animationsMap['rowOnActionTriggerAnimation8']!
                        .controller
                        .forward(from: 0.0);
                  }
                  logFirebaseEvent('feedback_custom_action');
                  await actions.inkwellClick();
                  logFirebaseEvent('feedback_bottom_sheet');
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: FeedbackDropdownWidget(
                          itemRef: widget.item!.reference,
                        ),
                      );
                    },
                  ).then((value) => setState(() {}));
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.elasticOut,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.feedback_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Give Feedback',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                      ],
                    ).animateOnActionTrigger(
                      animationsMap['rowOnActionTriggerAnimation1']!,
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MORE_DROPDOWN_COMP_regenerate_ON_TAP');
                  logFirebaseEvent('regenerate_widget_animation');
                  if (animationsMap['rowOnActionTriggerAnimation8'] != null) {
                    animationsMap['rowOnActionTriggerAnimation8']!
                        .controller
                        .forward(from: 0.0);
                  }
                  logFirebaseEvent('regenerate_backend_call');

                  final feedbackCreateData = {
                    ...createFeedbackRecordData(
                      itemRef: widget.item!.reference,
                      userRef: currentUserReference,
                      feedback: 'Regenerated',
                    ),
                    'screenshots': [
                      valueOrDefault<String>(
                        widget.item!.stable.imageUrls.first,
                        '0',
                      )
                    ],
                  };
                  var feedbackRecordReference = FeedbackRecord.collection.doc();
                  await feedbackRecordReference.set(feedbackCreateData);
                  _model.addRegenerateAsFeedback =
                      FeedbackRecord.getDocumentFromData(
                          feedbackCreateData, feedbackRecordReference);
                  logFirebaseEvent('regenerate_update_widget_state');
                  _model.itemText = widget.item!.itemText;
                  logFirebaseEvent('regenerate_backend_call');

                  final itemUpdateData1 = {
                    'itemText': FieldValue.delete(),
                    'status': FieldValue.delete(),
                    'stableImg2Img': FieldValue.delete(),
                    'instructPix2Pix': FieldValue.delete(),
                    'mainImage': FieldValue.delete(),
                  };
                  await widget.item!.reference.update(itemUpdateData1);
                  logFirebaseEvent('regenerate_backend_call');

                  final itemUpdateData2 = createItemRecordData(
                    itemText: _model.itemText,
                  );
                  await widget.item!.reference.update(itemUpdateData2);
                  logFirebaseEvent('regenerate_navigate_to');

                  context.goNamed('Items');

                  setState(() {});
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.replay_sharp,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Regenerate',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                      ],
                    ).animateOnActionTrigger(
                      animationsMap['rowOnActionTriggerAnimation2']!,
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MORE_DROPDOWN_COMP_detail_ON_TAP');
                  logFirebaseEvent('detail_widget_animation');
                  if (animationsMap['rowOnActionTriggerAnimation8'] != null) {
                    animationsMap['rowOnActionTriggerAnimation8']!
                        .controller
                        .forward(from: 0.0);
                  }
                  logFirebaseEvent('detail_navigate_to');

                  context.pushNamed(
                    'Details',
                    queryParameters: {
                      'itemRef': serializeParam(
                        widget.item!.reference,
                        ParamType.DocumentReference,
                      ),
                      'primary': serializeParam(
                        valueOrDefault<Color>(
                          widget.item!.stable.colorPalettes.primaryColor,
                          FlutterFlowTheme.of(context).primary,
                        ),
                        ParamType.Color,
                      ),
                      'contrasting': serializeParam(
                        valueOrDefault<Color>(
                          widget.item!.stable.colorPalettes.contrastingColor,
                          FlutterFlowTheme.of(context).secondary,
                        ),
                        ParamType.Color,
                      ),
                      'text': serializeParam(
                        Theme.of(context).brightness == Brightness.light
                            ? valueOrDefault<Color>(
                                widget.item!.stable.colorPalettes.lightVibrant,
                                FlutterFlowTheme.of(context).primaryBackground,
                              )
                            : valueOrDefault<Color>(
                                widget.item!.stable.colorPalettes.darkVibrant,
                                FlutterFlowTheme.of(context).primaryBackground,
                              ),
                        ParamType.Color,
                      ),
                    }.withoutNulls,
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.image_search,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'View Details',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                      ],
                    ).animateOnActionTrigger(
                      animationsMap['rowOnActionTriggerAnimation3']!,
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MORE_DROPDOWN_COMP_share_ON_TAP');
                  logFirebaseEvent('share_widget_animation');
                  if (animationsMap['rowOnActionTriggerAnimation8'] != null) {
                    animationsMap['rowOnActionTriggerAnimation8']!
                        .controller
                        .forward(from: 0.0);
                  }
                  logFirebaseEvent('share_custom_action');
                  await actions.shareFirebaseImage(
                    widget.item!.mainImage,
                    widget.item!.itemText,
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.share_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Share',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                      ],
                    ).animateOnActionTrigger(
                      animationsMap['rowOnActionTriggerAnimation4']!,
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MORE_DROPDOWN_COMP_edit_ON_TAP');
                  logFirebaseEvent('edit_widget_animation');
                  if (animationsMap['rowOnActionTriggerAnimation8'] != null) {
                    animationsMap['rowOnActionTriggerAnimation8']!
                        .controller
                        .forward(from: 0.0);
                  }
                  logFirebaseEvent('edit_navigate_to');

                  context.pushNamed(
                    'EditItem',
                    queryParameters: {
                      'itemRef': serializeParam(
                        widget.item!.reference,
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.edit_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Edit',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                      ],
                    ).animateOnActionTrigger(
                      animationsMap['rowOnActionTriggerAnimation5']!,
                    ),
                  ),
                ),
              ),
              if (valueOrDefault<bool>(
                widget.item!.location != null,
                false,
              ))
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('MORE_DROPDOWN_COMP_locatio_ON_TAP');
                    logFirebaseEvent('locatio_widget_animation');
                    if (animationsMap['rowOnActionTriggerAnimation8'] != null) {
                      animationsMap['rowOnActionTriggerAnimation8']!
                          .controller
                          .forward(from: 0.0);
                    }
                    logFirebaseEvent('locatio_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: Color(0x80000000),
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: LocationWidget(
                            location: widget.item!.location!,
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.location_pin,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Show Location',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['rowOnPageLoadAnimation']!),
                    ),
                  ),
                ),
              if (valueOrDefault<bool>(
                widget.item!.uploadedImages.image != null &&
                    widget.item!.uploadedImages.image != '',
                false,
              ))
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('MORE_DROPDOWN_COMP_uploadedImage_ON_TAP');
                    logFirebaseEvent('uploadedImage_widget_animation');
                    if (animationsMap['rowOnActionTriggerAnimation8'] != null) {
                      animationsMap['rowOnActionTriggerAnimation8']!
                          .controller
                          .forward(from: 0.0);
                    }
                    logFirebaseEvent('uploadedImage_bottom_sheet');
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Color(0x00FFFFFF),
                      barrierColor: Color(0x80000000),
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.85,
                            child: ImageSelfieWidget(
                              imageSelfie: widget.item!.uploadedImages.image,
                            ),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.photo_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Show Uploaded Image',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ).animateOnActionTrigger(
                        animationsMap['rowOnActionTriggerAnimation6']!,
                      ),
                    ),
                  ),
                ),
              if (valueOrDefault<bool>(
                widget.item!.uploadedImages.selfie != null &&
                    widget.item!.uploadedImages.selfie != '',
                false,
              ))
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'MORE_DROPDOWN_COMP_uploadedSelfie_ON_TAP');
                    logFirebaseEvent('uploadedSelfie_widget_animation');
                    if (animationsMap['rowOnActionTriggerAnimation8'] != null) {
                      animationsMap['rowOnActionTriggerAnimation8']!
                          .controller
                          .forward(from: 0.0);
                    }
                    logFirebaseEvent('uploadedSelfie_bottom_sheet');
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Color(0x00FFFFFF),
                      barrierColor: Color(0x80000000),
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: ImageSelfieWidget(
                            imageSelfie: widget.item!.uploadedImages.selfie,
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.portrait_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Show Uploaded Selfie',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ).animateOnActionTrigger(
                        animationsMap['rowOnActionTriggerAnimation7']!,
                      ),
                    ),
                  ),
                ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MORE_DROPDOWN_COMP_delete_ON_TAP');
                  logFirebaseEvent('delete_widget_animation');
                  if (animationsMap['rowOnActionTriggerAnimation8'] != null) {
                    animationsMap['rowOnActionTriggerAnimation8']!
                        .controller
                        .forward(from: 0.0);
                  }
                  logFirebaseEvent('delete_backend_call');
                  await widget.item!.reference.delete();
                  logFirebaseEvent('delete_navigate_to');

                  context.goNamed('Items');
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.delete_outlined,
                            color: FlutterFlowTheme.of(context).tertiary,
                            size: 24.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Delete',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ).animateOnActionTrigger(
                      animationsMap['rowOnActionTriggerAnimation8']!,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
