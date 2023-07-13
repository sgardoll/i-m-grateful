import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_style/custom_style_widget.dart';
import '/components/small_infinity_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'art_style_model.dart';
export 'art_style_model.dart';

class ArtStyleWidget extends StatefulWidget {
  const ArtStyleWidget({
    Key? key,
    this.updatedStyle,
  }) : super(key: key);

  final String? updatedStyle;

  @override
  _ArtStyleWidgetState createState() => _ArtStyleWidgetState();
}

class _ArtStyleWidgetState extends State<ArtStyleWidget> {
  late ArtStyleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArtStyleModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Material(
            color: Colors.transparent,
            elevation: 12.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.85,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: FFAppState().bodyTextColor,
                    offset: Offset(0.0, 2.0),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
                        child: Container(
                          width: 60.0,
                          height: 4.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryText,
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            widget.updatedStyle != null &&
                                    widget.updatedStyle != ''
                                ? 'Current entries style is: ${widget.updatedStyle}'
                                : 'Your art style is currently: ${valueOrDefault(currentUserDocument?.style, '')}',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 0.0, 16.0),
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Builder(
                                builder: (context) => FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ART_STYLE_CREATE_YOUR_OWN_CUSTOM_STYLE_B');
                                    logFirebaseEvent('Button_alert_dialog');
                                    await showAlignedDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      isGlobal: true,
                                      avoidOverflow: false,
                                      targetAnchor: AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      followerAnchor: AlignmentDirectional(
                                              0.0, -1.0)
                                          .resolve(Directionality.of(context)),
                                      builder: (dialogContext) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: Container(
                                            height: 400.0,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            child: CustomStyleWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(
                                        () => _model.customArtStyle = value));

                                    if (_model.customArtStyle != null &&
                                        _model.customArtStyle != '') {
                                      logFirebaseEvent('Button_backend_call');

                                      var customStylesRecordReference =
                                          CustomStylesRecord.collection.doc();
                                      await customStylesRecordReference
                                          .set(createCustomStylesRecordData(
                                        style: _model.customArtStyle,
                                        userRef: currentUserReference,
                                      ));
                                      _model.createCustomArtStyle =
                                          CustomStylesRecord
                                              .getDocumentFromData(
                                                  createCustomStylesRecordData(
                                                    style:
                                                        _model.customArtStyle,
                                                    userRef:
                                                        currentUserReference,
                                                  ),
                                                  customStylesRecordReference);
                                      logFirebaseEvent('Button_backend_call');

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        style: _model.customArtStyle,
                                      ));
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Style preference changed to ${valueOrDefault(currentUserDocument?.style, '')}',
                                            style: GoogleFonts.getFont(
                                              'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                      );
                                    }
                                    if (widget.updatedStyle != null &&
                                        widget.updatedStyle != '') {
                                      logFirebaseEvent('Button_bottom_sheet');
                                      Navigator.pop(
                                          context, _model.customArtStyle);
                                    } else {
                                      logFirebaseEvent('Button_navigate_back');
                                      context.safePop();
                                    }

                                    setState(() {});
                                  },
                                  text: 'Create Your Own Custom Style',
                                  icon: Icon(
                                    Icons.format_paint_rounded,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 250.0,
                                    height: 30.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    250.0, 0.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.smallInfinityModel,
                                  updateCallback: () => setState(() {}),
                                  child: SmallInfinityWidget(
                                    infinUrl:
                                        'https://www.connectio.com.au/grateful/infin/3B.png',
                                    infinUrlDark:
                                        'https://www.connectio.com.au/grateful/infin/3W.png',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Or choose a pre-defined style below:',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.7,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 48.0),
                            child: AuthUserStreamWidget(
                              builder: (context) =>
                                  StreamBuilder<List<StylesRecord>>(
                                stream: FFAppState().stylePref(
                                  uniqueQueryKey: valueOrDefault(
                                      currentUserDocument?.style, ''),
                                  requestFn: () => queryStylesRecord(
                                    queryBuilder: (stylesRecord) =>
                                        stylesRecord.orderBy('style'),
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitRipple(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<StylesRecord> gridViewStylesRecordList =
                                      snapshot.data!;
                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 16.0,
                                      childAspectRatio: 0.55,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemCount: gridViewStylesRecordList.length,
                                    itemBuilder: (context, gridViewIndex) {
                                      final gridViewStylesRecord =
                                          gridViewStylesRecordList[
                                              gridViewIndex];
                                      return Container(
                                        width: 100.0,
                                        height: 125.0,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.network(
                                              valueOrDefault<String>(
                                                gridViewStylesRecord.image,
                                                'https://www.connectio.com.au/grateful/Loading.png',
                                              ),
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.85),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ART_STYLE_COMP_LOGIN_BTN_ON_TAP');
                                              if (widget.updatedStyle != null &&
                                                  widget.updatedStyle != '') {
                                                logFirebaseEvent(
                                                    'Button_bottom_sheet');
                                                Navigator.pop(context,
                                                    gridViewStylesRecord.style);
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                await currentUserReference!
                                                    .update(
                                                        createUsersRecordData(
                                                  style: gridViewStylesRecord
                                                      .style,
                                                ));
                                                logFirebaseEvent(
                                                    'Button_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Style preference changed to ${valueOrDefault(currentUserDocument?.style, '')}',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                  ),
                                                );
                                                logFirebaseEvent(
                                                    'Button_navigate_back');
                                                context.safePop();
                                              }
                                            },
                                            text: gridViewStylesRecord.style,
                                            options: FFButtonOptions(
                                              width: 200.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 10.0,
                                                      ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
