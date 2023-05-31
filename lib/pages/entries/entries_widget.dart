import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/feedback_dropdown/feedback_dropdown_widget.dart';
import '/components/more_dropdown_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/pages_sub/details/details_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'entries_model.dart';
export 'entries_model.dart';

class EntriesWidget extends StatefulWidget {
  const EntriesWidget({Key? key}) : super(key: key);

  @override
  _EntriesWidgetState createState() => _EntriesWidgetState();
}

class _EntriesWidgetState extends State<EntriesWidget>
    with TickerProviderStateMixin {
  late EntriesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'iconOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 30000.ms,
          begin: 0.0,
          end: -3.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntriesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Entries'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ItemRecord>>(
      stream: FFAppState().items(
        requestFn: () => queryItemRecord(
          queryBuilder: (itemRecord) => itemRecord
              .where('userRef', isEqualTo: currentUserReference)
              .orderBy('timestamp', descending: true),
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
        List<ItemRecord> entriesItemRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        FFAppState().primary,
                        FlutterFlowTheme.of(context).primaryText,
                      ),
                      borderRadius: BorderRadius.circular(0.0),
                      border: Border.all(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 48.0, 0.0, 24.0),
                      child: Text(
                        'YOUR ENTRIES',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Raleway',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                  if (entriesItemRecordList
                          .where((e) => e.status != 'Success')
                          .toList()
                          .length >=
                      1)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 1.0,
                              height: 38.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  FFAppState().primary,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.sync_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 24.0,
                                  ).animateOnPageLoad(animationsMap[
                                      'iconOnPageLoadAnimation']!),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 8.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      'Generating ${valueOrDefault<String>(
                                        entriesItemRecordList
                                            .where((e) => e.status != 'Success')
                                            .toList()
                                            .length
                                            .toString(),
                                        '0',
                                      )}${valueOrDefault<int>(
                                            entriesItemRecordList
                                                .where((e) =>
                                                    e.status != 'Success')
                                                .toList()
                                                .length,
                                            0,
                                          ) == 1 ? ' image' : ' images'}',
                                      'Generating images',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Raleway',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final items = entriesItemRecordList
                            .map((e) => e)
                            .toList()
                            .where((e) => e.status == 'Success')
                            .toList();
                        if (items.isEmpty) {
                          return Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 1.0,
                              child: EmptyListWidget(),
                            ),
                          );
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: items.length,
                          itemBuilder: (context, itemsIndex) {
                            final itemsItem = items[itemsIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ENTRIES_PAGE_Card_t0rihpmj_ON_TAP');
                                  logFirebaseEvent('Card_navigate_to');
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsWidget(
                                        itemRef: itemsItem.reference,
                                        primary: colorFromCssString(
                                          itemsItem.primaryColor,
                                          defaultColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                        contrasting: colorFromCssString(
                                          itemsItem.contrastingColor,
                                          defaultColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                        text: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? colorFromCssString(
                                                itemsItem.lightVibrant,
                                                defaultColor:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                              )
                                            : colorFromCssString(
                                                itemsItem.darkVibrant,
                                                defaultColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        height: 38.0,
                                        decoration: BoxDecoration(
                                          color: colorFromCssString(
                                            itemsItem.primaryColor,
                                            defaultColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(8.0),
                                            topRight: Radius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 8.0, 12.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (valueOrDefault<bool>(
                                                      itemsItem
                                                              .stable
                                                              .colorPalettes
                                                              .primaryColor ==
                                                          null,
                                                      false,
                                                    ))
                                                      Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Container(
                                                          width: 60.0,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              1.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxHeight: 100.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  CachedNetworkImageProvider(
                                                                valueOrDefault<
                                                                    String>(
                                                                  itemsItem
                                                                      .stable
                                                                      .imageUrls
                                                                      .first,
                                                                  '0',
                                                                ),
                                                              ),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .calendar_today_rounded,
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      Theme.of(context).brightness ==
                                                                              Brightness.dark
                                                                          ? colorFromCssString(
                                                                              itemsItem.darkVibrant,
                                                                              defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                            )
                                                                          : colorFromCssString(
                                                                              itemsItem.lightVibrant,
                                                                              defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                    ),
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  dateTimeFormat(
                                                                      'MMMEd',
                                                                      itemsItem
                                                                          .timestamp!),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          Theme.of(context).brightness == Brightness.dark
                                                                              ? colorFromCssString(
                                                                                  itemsItem.darkVibrant,
                                                                                  defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                )
                                                                              : colorFromCssString(
                                                                                  itemsItem.lightVibrant,
                                                                                  defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                ),
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                        ),
                                                                        fontSize:
                                                                            12.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    dateTimeFormat(
                                                                        'jm',
                                                                        itemsItem
                                                                            .timestamp!),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            Theme.of(context).brightness == Brightness.dark
                                                                                ? colorFromCssString(
                                                                                    itemsItem.darkVibrant,
                                                                                    defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                  )
                                                                                : colorFromCssString(
                                                                                    itemsItem.lightVibrant,
                                                                                    defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                  ),
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                          fontSize:
                                                                              10.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .chevron_right_rounded,
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                Theme.of(context)
                                                                            .brightness ==
                                                                        Brightness
                                                                            .dark
                                                                    ? colorFromCssString(
                                                                        itemsItem
                                                                            .darkVibrant,
                                                                        defaultColor:
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                      )
                                                                    : colorFromCssString(
                                                                        itemsItem
                                                                            .lightVibrant,
                                                                        defaultColor:
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                      ),
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                              size: 24.0,
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    AutoSizeText(
                                                                      itemsItem
                                                                          .itemText,
                                                                      maxLines:
                                                                          3,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto Condensed',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      itemsItem.moreText !=
                                                                              null &&
                                                                          itemsItem.moreText !=
                                                                              '',
                                                                      false,
                                                                    ))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          itemsItem
                                                                              .moreText,
                                                                          maxLines:
                                                                              10,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .override(
                                                                                fontFamily: 'Roboto Condensed',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      itemsItem
                                                                              .location !=
                                                                          null,
                                                                      false,
                                                                    ))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .location_on,
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            Theme.of(context).brightness == Brightness.dark
                                                                                ? colorFromCssString(
                                                                                    itemsItem.darkVibrant,
                                                                                    defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                  )
                                                                                : colorFromCssString(
                                                                                    itemsItem.lightVibrant,
                                                                                    defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                  ),
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                      ),
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      itemsItem.photo !=
                                                                              null &&
                                                                          itemsItem.photo !=
                                                                              '',
                                                                      false,
                                                                    ))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .photo_outlined,
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            Theme.of(context).brightness == Brightness.dark
                                                                                ? colorFromCssString(
                                                                                    itemsItem.darkVibrant,
                                                                                    defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                  )
                                                                                : colorFromCssString(
                                                                                    itemsItem.lightVibrant,
                                                                                    defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                  ),
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                      ),
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      itemsItem.selfie !=
                                                                              null &&
                                                                          itemsItem.selfie !=
                                                                              '',
                                                                      false,
                                                                    ))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .portrait_rounded,
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            Theme.of(context).brightness == Brightness.dark
                                                                                ? colorFromCssString(
                                                                                    itemsItem.darkVibrant,
                                                                                    defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                  )
                                                                                : colorFromCssString(
                                                                                    itemsItem.lightVibrant,
                                                                                    defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                  ),
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                          size:
                                                                              20.0,
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
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ENTRIES_PAGE_DELETE_BTN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Button_backend_call');
                                                    await itemsItem.reference
                                                        .delete();
                                                  },
                                                  text: 'Delete',
                                                  icon: Icon(
                                                    Icons.delete_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                    elevation: 2.0,
                                                    borderSide: BorderSide(
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) =>
                                                      FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'ENTRIES_PAGE_SHARE_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_share');
                                                      await Share.share(
                                                        functions
                                                            .getImageStringFromPath(
                                                                valueOrDefault<
                                                                    String>(
                                                          itemsItem.stable
                                                              .imageUrls.first,
                                                          '0',
                                                        )),
                                                        sharePositionOrigin:
                                                            getWidgetBoundingBox(
                                                                context),
                                                      );
                                                    },
                                                    text: 'Share',
                                                    icon: Icon(
                                                      Icons.share_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) =>
                                                      FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'ENTRIES_PAGE__BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_alert_dialog');
                                                      await showAlignedDialog(
                                                        barrierColor:
                                                            FFAppState()
                                                                .bodyTextColor,
                                                        context: context,
                                                        isGlobal: false,
                                                        avoidOverflow: true,
                                                        targetAnchor:
                                                            Alignment(0.0, 0.0),
                                                        followerAnchor:
                                                            Alignment(0.0, 0.0),
                                                        builder:
                                                            (dialogContext) {
                                                          return Material(
                                                            color: Colors
                                                                .transparent,
                                                            child:
                                                                FeedbackDropdownWidget(
                                                              itemRef: itemsItem
                                                                  .reference,
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    text: '',
                                                    icon: Icon(
                                                      Icons.feedback_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) =>
                                                      FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'ENTRIES_PAGE__BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_alert_dialog');
                                                      await showAlignedDialog(
                                                        barrierColor:
                                                            FFAppState()
                                                                .bodyTextColor,
                                                        context: context,
                                                        isGlobal: false,
                                                        avoidOverflow: true,
                                                        targetAnchor:
                                                            Alignment(0.0, 0.0),
                                                        followerAnchor:
                                                            Alignment(0.0, 0.0),
                                                        builder:
                                                            (dialogContext) {
                                                          return Material(
                                                            color: Colors
                                                                .transparent,
                                                            child:
                                                                MoreDropdownWidget(
                                                              item: itemsItem,
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    text: '',
                                                    icon: Icon(
                                                      Icons.more_vert_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.navBarModel,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: NavBarWidget(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
