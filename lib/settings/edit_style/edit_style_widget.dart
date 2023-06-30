import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_style/custom_style_widget.dart';
import '/components/small_infinity_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_style_model.dart';
export 'edit_style_model.dart';

class EditStyleWidget extends StatefulWidget {
  const EditStyleWidget({Key? key}) : super(key: key);

  @override
  _EditStyleWidgetState createState() => _EditStyleWidgetState();
}

class _EditStyleWidgetState extends State<EditStyleWidget> {
  late EditStyleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditStyleModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'EditStyle'});
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 48.0,
          icon: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 30.0,
          ),
          onPressed: () async {
            logFirebaseEvent('EDIT_STYLE_chevron_left_rounded_ICN_ON_T');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'Edit Art Style',
          style: FlutterFlowTheme.of(context).headlineMedium,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Text(
                      'Your art style is currently: ${valueOrDefault(currentUserDocument?.style, '')}',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Builder(
                          builder: (context) => FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'EDIT_STYLE_CREATE_YOUR_OWN_CUSTOM_STYLE_');
                              logFirebaseEvent('Button_alert_dialog');
                              await showAlignedDialog(
                                barrierDismissible: false,
                                context: context,
                                isGlobal: true,
                                avoidOverflow: false,
                                targetAnchor: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                followerAnchor: AlignmentDirectional(0.0, -1.0)
                                    .resolve(Directionality.of(context)),
                                builder: (dialogContext) {
                                  return Material(
                                    color: Colors.transparent,
                                    child: Container(
                                      height: 400.0,
                                      width: MediaQuery.sizeOf(context).width *
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
                                    CustomStylesRecord.getDocumentFromData(
                                        createCustomStylesRecordData(
                                          style: _model.customArtStyle,
                                          userRef: currentUserReference,
                                        ),
                                        customStylesRecordReference);
                                logFirebaseEvent('Button_backend_call');

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  style: _model.customArtStyle,
                                ));
                                logFirebaseEvent('Button_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Style preference changed to ${valueOrDefault(currentUserDocument?.style, '')}',
                                      style: GoogleFonts.getFont(
                                        'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                  ),
                                );
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
                              textStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
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
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.75,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 24.0),
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
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'EDIT_STYLE_PAGE_LOGIN_BTN_ON_TAP');
                                      logFirebaseEvent('Button_backend_call');

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        style: gridViewStylesRecord.style,
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
                                      logFirebaseEvent('Button_navigate_back');
                                      context.safePop();
                                    },
                                    text: gridViewStylesRecord.style,
                                    options: FFButtonOptions(
                                      width: 200.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 16.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
    );
  }
}
