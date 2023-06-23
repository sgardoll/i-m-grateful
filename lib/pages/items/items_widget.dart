import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/item_stack_widget.dart';
import '/components/more_dropdown_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
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
      logFirebaseEvent('Items_firestore_query');
      _model.queryUser = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) =>
            usersRecord.where('uid', isEqualTo: currentUserUid),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.queryUser!.style == null || _model.queryUser!.style == '') {
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
      } else if (_model.queryUser!.gender == null ||
          _model.queryUser!.gender == '') {
        logFirebaseEvent('Items_navigate_to');

        context.goNamed(
          'EditProfile',
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
                  .where('status', isEqualTo: 'Success')
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
                    logFirebaseEvent('ITEMS_PageView_tkq3o76d_ON_WIDGET_SWIPE');
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
                    FFAppState().lightVibrant = colorFromCssString(
                      pageViewItemRecordList[_model.pageViewCurrentIndex]
                          .lightVibrant,
                      defaultColor: FlutterFlowTheme.of(context).secondaryText,
                    );
                    FFAppState().darkVibrant = colorFromCssString(
                      pageViewItemRecordList[_model.pageViewCurrentIndex]
                          .darkVibrant,
                      defaultColor: FlutterFlowTheme.of(context).primaryText,
                    );
                  },
                  scrollDirection: Axis.vertical,
                  itemCount: pageViewItemRecordList.length,
                  itemBuilder: (context, pageViewIndex) {
                    final pageViewItemRecord =
                        pageViewItemRecordList[pageViewIndex];
                    return Stack(
                      children: [
                        Builder(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'ITEMS_PAGE_Container_gylkey1z_ON_TAP');
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'FullscreenImage',
                                queryParameters: {
                                  'imageUrl': serializeParam(
                                    pageViewItemRecord.mainImage,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.scale,
                                    alignment: Alignment.bottomCenter,
                                  ),
                                },
                              );
                            },
                            onLongPress: () async {
                              logFirebaseEvent(
                                  'ITEMS_Container_gylkey1z_ON_LONG_PRESS');
                              logFirebaseEvent('Container_alert_dialog');
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
                            child: Container(
                              width: MediaQuery.of(context).size.width * 1.0,
                              height: MediaQuery.of(context).size.height * 1.0,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: CachedNetworkImage(
                                  imageUrl: valueOrDefault<String>(
                                    pageViewItemRecord.mainImage,
                                    'https://www.connectio.com.au/grateful/loading.png',
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height:
                                      MediaQuery.of(context).size.height * 1.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.animatedTextModels.getModel(
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
                  child: NavBarWidget(
                    activePage: 'Home',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
