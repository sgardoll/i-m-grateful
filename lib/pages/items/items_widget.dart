import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/item_stack_widget.dart';
import '/components/more_dropdown_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'items_model.dart';
export 'items_model.dart';

class ItemsWidget extends StatefulWidget {
  const ItemsWidget({Key? key}) : super(key: key);

  @override
  _ItemsWidgetState createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  late ItemsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Items'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ITEMS_PAGE_Items_ON_INIT_STATE');
      if (!(valueOrDefault(currentUserDocument?.style, '') != null &&
          valueOrDefault(currentUserDocument?.style, '') != '')) {
        logFirebaseEvent('Items_navigate_to');

        context.goNamed(
          'StyleChoice',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: valueOrDefault<Color>(
          FFAppState().primary,
          FlutterFlowTheme.of(context).primary,
        ),
        body: Stack(
          children: [
            StreamBuilder<List<ItemRecord>>(
              stream: queryItemRecord(
                queryBuilder: (itemRecord) => itemRecord
                    .where('userRef', isEqualTo: currentUserReference)
                    .where('status', isEqualTo: FFAppState().success)
                    .orderBy('timestamp', descending: true),
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
                List<ItemRecord> pageViewItemRecordList = snapshot.data!;
                if (pageViewItemRecordList.isEmpty) {
                  return Center(
                    child: EmptyListWidget(),
                  );
                }
                return Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 1.0,
                  child: PageView.builder(
                    controller: _model.pageViewController ??= PageController(
                        initialPage: min(0, pageViewItemRecordList.length - 1)),
                    onPageChanged: (_) async {
                      logFirebaseEvent(
                          'ITEMS_PageView_tkq3o76d_ON_WIDGET_SWIPE');
                      logFirebaseEvent('PageView_update_app_state');
                      FFAppState().primary = colorFromCssString(
                        pageViewItemRecordList[_model.pageViewCurrentIndex]
                            .primaryColor,
                        defaultColor: FlutterFlowTheme.of(context).primary,
                      );
                      FFAppState().contrasting = colorFromCssString(
                        pageViewItemRecordList[_model.pageViewCurrentIndex]
                            .contrastingColor,
                        defaultColor: FlutterFlowTheme.of(context).secondary,
                      );
                      FFAppState().bodyTextColor = valueOrDefault<Color>(
                        Theme.of(context).brightness == Brightness.light
                            ? colorFromCssString(
                                pageViewItemRecordList[
                                        _model.pageViewCurrentIndex]
                                    .lightVibrant,
                                defaultColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              )
                            : colorFromCssString(
                                pageViewItemRecordList[
                                        _model.pageViewCurrentIndex]
                                    .darkVibrant,
                                defaultColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                        FlutterFlowTheme.of(context).secondaryBackground,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: pageViewItemRecordList.length,
                    itemBuilder: (context, pageViewIndex) {
                      final pageViewItemRecord =
                          pageViewItemRecordList[pageViewIndex];
                      return Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'ITEMS_PAGE_Stack_poyb5l6o_ON_TAP');
                            logFirebaseEvent('Stack_navigate_to');

                            context.pushNamed(
                              'Details',
                              queryParameters: {
                                'itemRef': serializeParam(
                                  pageViewItemRecord.reference,
                                  ParamType.DocumentReference,
                                ),
                                'primary': serializeParam(
                                  colorFromCssString(
                                    pageViewItemRecord.primaryColor,
                                    defaultColor:
                                        FlutterFlowTheme.of(context).primary,
                                  ),
                                  ParamType.Color,
                                ),
                                'contrasting': serializeParam(
                                  colorFromCssString(
                                    pageViewItemRecord.contrastingColor,
                                    defaultColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                  ParamType.Color,
                                ),
                                'text': serializeParam(
                                  Theme.of(context).brightness ==
                                          Brightness.light
                                      ? colorFromCssString(
                                          pageViewItemRecord.lightVibrant,
                                          defaultColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        )
                                      : colorFromCssString(
                                          pageViewItemRecord.lightVibrant,
                                          defaultColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                  ParamType.Color,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                ),
                              },
                            );
                          },
                          onLongPress: () async {
                            logFirebaseEvent(
                                'ITEMS_PAGE_Stack_poyb5l6o_ON_LONG_PRESS');
                            logFirebaseEvent('Stack_alert_dialog');
                            showAlignedDialog(
                              context: context,
                              isGlobal: false,
                              avoidOverflow: true,
                              targetAnchor: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              followerAnchor: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              builder: (dialogContext) {
                                return Material(
                                  color: Colors.transparent,
                                  child: MoreDropdownWidget(
                                    item: pageViewItemRecord,
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          child: Stack(
                            children: [
                              wrapWithModel(
                                model: _model.itemStackModels.getModel(
                                  pageViewItemRecord.reference.id,
                                  pageViewIndex,
                                ),
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: ItemStackWidget(
                                  key: Key(
                                    'Keyjjz_${pageViewItemRecord.reference.id}',
                                  ),
                                  item: pageViewItemRecord,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: NavBarWidget(),
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
