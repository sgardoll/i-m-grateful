import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/infinity/infinity_feature/infinity_feature_widget.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    Key? key,
    this.activePage,
  }) : super(key: key);

  final String? activePage;

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 16.0),
          child: Container(
            width: double.infinity,
            height: 100.0,
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 6.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                FFAppState().primary,
                                FlutterFlowTheme.of(context).primaryText,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 12.0,
                                  color: Color(0x33000000),
                                  offset: Offset(-2.0, -6.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                fillColor: valueOrDefault<Color>(
                                  widget.activePage == 'Home'
                                      ? Color(0x4C616161)
                                      : Colors.transparent,
                                  Colors.transparent,
                                ),
                                hoverColor: Color(0x4C616161),
                                hoverIconColor: valueOrDefault<Color>(
                                  widget.activePage == 'Home'
                                      ? FFAppState().lightVibrant
                                      : FFAppState().darkVibrant,
                                  FlutterFlowTheme.of(context).accent3,
                                ),
                                icon: Icon(
                                  Icons.home_rounded,
                                  color: valueOrDefault<Color>(
                                    widget.activePage == 'Home'
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .secondary,
                                    FlutterFlowTheme.of(context).secondary,
                                  ),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'NAV_BAR_COMP_home_rounded_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.pushNamed(
                                    'Items',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                fillColor: valueOrDefault<Color>(
                                  widget.activePage == 'Entries'
                                      ? Color(0x4C616161)
                                      : Colors.transparent,
                                  Colors.transparent,
                                ),
                                hoverColor: Color(0x4C616161),
                                hoverIconColor: valueOrDefault<Color>(
                                  widget.activePage == 'Entries'
                                      ? FFAppState().lightVibrant
                                      : FFAppState().darkVibrant,
                                  FlutterFlowTheme.of(context).accent3,
                                ),
                                icon: Icon(
                                  Icons.table_rows_rounded,
                                  color: valueOrDefault<Color>(
                                    widget.activePage == 'Entries'
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .secondary,
                                    FlutterFlowTheme.of(context).secondary,
                                  ),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'NAV_BAR_table_rows_rounded_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.pushNamed(
                                    'Entries',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 30.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 25.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                fillColor: valueOrDefault<Color>(
                                  FFAppState().contrasting,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                hoverColor: valueOrDefault<Color>(
                                  FFAppState().darkVibrant,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                hoverIconColor: valueOrDefault<Color>(
                                  FFAppState().lightVibrant,
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                icon: Icon(
                                  Icons.add,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'NAV_BAR_COMP_MiddleButton_ON_TAP');
                                  logFirebaseEvent('MiddleButton_navigate_to');

                                  context.pushNamed(
                                    'NewItem',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.bottomToTop,
                                      ),
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                fillColor: valueOrDefault<Color>(
                                  widget.activePage == 'Explore'
                                      ? Color(0x4C616161)
                                      : Colors.transparent,
                                  Colors.transparent,
                                ),
                                hoverColor: Color(0x4C616161),
                                hoverIconColor: valueOrDefault<Color>(
                                  widget.activePage == 'Explore'
                                      ? FFAppState().lightVibrant
                                      : FFAppState().darkVibrant,
                                  FlutterFlowTheme.of(context).accent3,
                                ),
                                icon: Icon(
                                  Icons.image_search_rounded,
                                  color: valueOrDefault<Color>(
                                    widget.activePage == 'Explore'
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .secondary,
                                    FlutterFlowTheme.of(context).secondary,
                                  ),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'NAV_BAR_COMP_Explore_ON_TAP');
                                  logFirebaseEvent('Explore_revenue_cat');
                                  final isEntitled =
                                      await revenue_cat.isEntitled('Unlimited');
                                  if (isEntitled == null) {
                                    return;
                                  } else if (!isEntitled) {
                                    await revenue_cat.loadOfferings();
                                  }

                                  if (isEntitled) {
                                    logFirebaseEvent('Explore_navigate_to');

                                    context.pushNamed(
                                      'Explore',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                        ),
                                      },
                                    );
                                  } else {
                                    logFirebaseEvent('Explore_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      isDismissible: false,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: InfinityFeatureWidget(
                                            premiumFeature: 'The Explore tab',
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() =>
                                        _model.subscriptionSuccess = value));

                                    if (_model.subscriptionSuccess!) {
                                      logFirebaseEvent('Explore_bottom_sheet');
                                      Navigator.pop(context);
                                      logFirebaseEvent('Explore_navigate_to');

                                      context.pushNamed(
                                        'Explore',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                          ),
                                        },
                                      );
                                    }
                                  }

                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                fillColor: valueOrDefault<Color>(
                                  widget.activePage == 'Settings'
                                      ? Color(0x4C616161)
                                      : Colors.transparent,
                                  Colors.transparent,
                                ),
                                hoverColor: Color(0x4C616161),
                                hoverIconColor: valueOrDefault<Color>(
                                  widget.activePage == 'Settings'
                                      ? FFAppState().lightVibrant
                                      : FFAppState().darkVibrant,
                                  FlutterFlowTheme.of(context).accent3,
                                ),
                                icon: Icon(
                                  Icons.settings_rounded,
                                  color: valueOrDefault<Color>(
                                    widget.activePage == 'Settings'
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .secondary,
                                    FlutterFlowTheme.of(context).secondary,
                                  ),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'NAV_BAR_COMP_settings_rounded_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.pushNamed(
                                    'Settings',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
