import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'art_style_model.dart';
export 'art_style_model.dart';

class ArtStyleWidget extends StatefulWidget {
  const ArtStyleWidget({Key? key}) : super(key: key);

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
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
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
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Text(
                        'Your art style is currently: ${valueOrDefault(currentUserDocument?.style, '')}',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 24.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => StreamBuilder<List<StylesRecord>>(
                          stream: FFAppState().stylePref(
                            uniqueQueryKey:
                                valueOrDefault(currentUserDocument?.style, ''),
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
                                    color: FlutterFlowTheme.of(context).primary,
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
                                    gridViewStylesRecordList[gridViewIndex];
                                return Container(
                                  width: 100.0,
                                  height: 125.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'ART_STYLE_COMP_Image_vz1sy0np_ON_TAP');
                                          logFirebaseEvent(
                                              'Image_expand_image');
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              child:
                                                  FlutterFlowExpandedImageView(
                                                image: Image.network(
                                                  gridViewStylesRecord.image,
                                                  fit: BoxFit.contain,
                                                ),
                                                allowRotation: false,
                                                tag: gridViewStylesRecord.image,
                                                useHeroAnimation: true,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Hero(
                                          tag: gridViewStylesRecord.image,
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(25.0),
                                              topRight: Radius.circular(25.0),
                                            ),
                                            child: Image.network(
                                              gridViewStylesRecord.image,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1.0,
                                              height: 150.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.85),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'ART_STYLE_COMP_LOGIN_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            final usersUpdateData =
                                                createUsersRecordData(
                                              style: gridViewStylesRecord.style,
                                            );
                                            await currentUserReference!
                                                .update(usersUpdateData);
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Style preference changed to ${valueOrDefault(currentUserDocument?.style, '')}',
                                                  style: GoogleFonts.getFont(
                                                    'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent3,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            );
                                            logFirebaseEvent(
                                                'Button_navigate_back');
                                            Navigator.pop(context);
                                          },
                                          text: gridViewStylesRecord.style,
                                          options: FFButtonOptions(
                                            width: 200.0,
                                            height: 30.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
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
                                    ],
                                  ),
                                );
                              },
                            );
                          },
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
    );
  }
}
