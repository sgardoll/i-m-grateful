import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/more_dropdown/more_dropdown_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'entries_model.dart';
export 'entries_model.dart';

class EntriesWidget extends StatefulWidget {
  const EntriesWidget({Key? key}) : super(key: key);

  @override
  _EntriesWidgetState createState() => _EntriesWidgetState();
}

class _EntriesWidgetState extends State<EntriesWidget> {
  late EntriesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
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
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    StickyHeader(
                      overlapHeaders: false,
                      header: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 48.0, 24.0, 24.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'ENTRIES',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Raleway',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                if (valueOrDefault<bool>(
                                  FFAppState().showListView == false,
                                  false,
                                ))
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: Colors.transparent,
                                    icon: Icon(
                                      Icons.table_rows_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'ENTRIES_table_rows_rounded_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_update_app_state');
                                      setState(() {
                                        FFAppState().showListView = true;
                                      });
                                    },
                                  ),
                                if (valueOrDefault<bool>(
                                  FFAppState().showListView == true,
                                  true,
                                ))
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: Colors.transparent,
                                    icon: Icon(
                                      Icons.grid_on_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'ENTRIES_PAGE_grid_on_rounded_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_update_app_state');
                                      setState(() {
                                        FFAppState().showListView = false;
                                      });
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (valueOrDefault<bool>(
                            entriesItemRecordList
                                    .where((e) => valueOrDefault<bool>(
                                          e.status == 'Error',
                                          false,
                                        ))
                                    .toList()
                                    .length >=
                                1,
                            false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 38.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).error,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.error_outline_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 24.0,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 8.0, 0.0),
                                              child: Text(
                                                '${valueOrDefault<String>(
                                                  entriesItemRecordList
                                                      .where((e) =>
                                                          e.status == 'Error')
                                                      .toList()
                                                      .length
                                                      .toString(),
                                                  '0',
                                                )}${entriesItemRecordList.where((e) => valueOrDefault<bool>(
                                                      valueOrDefault<bool>(
                                                            e.status ==
                                                                'Started',
                                                            false,
                                                          ) ||
                                                          valueOrDefault<bool>(
                                                            e.status == '',
                                                            false,
                                                          ),
                                                      false,
                                                    )).toList().length == 1 ? ' entry' : ' entries'} returned an error',
                                                maxLines: 3,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Raleway',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ENTRIES_PAGE_RETRY_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_update_widget_state');
                                              _model.itemText =
                                                  entriesItemRecordList
                                                      .where((e) =>
                                                          e.status == 'Error')
                                                      .toList()
                                                      .map((e) => e.itemText)
                                                      .toList()
                                                      .cast<String>();
                                              _model.itemRefs =
                                                  entriesItemRecordList
                                                      .where((e) =>
                                                          e.status == 'Error')
                                                      .toList()
                                                      .map((e) => e.reference)
                                                      .toList()
                                                      .cast<
                                                          DocumentReference>();
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await entriesItemRecordList
                                                  .where((e) =>
                                                      e.reference ==
                                                      _model.itemRefs.first)
                                                  .toList()
                                                  .first
                                                  .reference
                                                  .update({
                                                'itemText': FieldValue.delete(),
                                                'status': FieldValue.delete(),
                                              });
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await entriesItemRecordList
                                                  .where((e) =>
                                                      e.reference ==
                                                      _model.itemRefs.first)
                                                  .toList()
                                                  .first
                                                  .reference
                                                  .update(createItemRecordData(
                                                    itemText:
                                                        entriesItemRecordList
                                                            .where((e) =>
                                                                e.reference ==
                                                                _model.itemRefs
                                                                    .first)
                                                            .toList()
                                                            .first
                                                            .itemText,
                                                  ));
                                            },
                                            text: 'Retry',
                                            options: FFButtonOptions(
                                              height: 24.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: const CircleBorder(),
                                              child: Container(
                                                width: 24.0,
                                                height: 24.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'ENTRIES_PAGE_Icon_db929k7e_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_backend_call');
                                                    await entriesItemRecordList
                                                        .where((e) =>
                                                            e.reference ==
                                                            _model
                                                                .itemRefs.first)
                                                        .toList()
                                                        .first
                                                        .reference
                                                        .delete();
                                                  },
                                                  child: Icon(
                                                    Icons.cancel_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 24.0,
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
                          Builder(
                            builder: (context) {
                              final started = entriesItemRecordList
                                  .where((e) => valueOrDefault<bool>(
                                        valueOrDefault<bool>(
                                              e.status == 'Started',
                                              false,
                                            ) ||
                                            valueOrDefault<bool>(
                                              e.status == '',
                                              false,
                                            ),
                                        false,
                                      ))
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: started.length,
                                itemBuilder: (context, startedIndex) {
                                  final startedItem = started[startedIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 4.0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 4.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'ENTRIES_PAGE_StackCardView_ON_TAP');
                                          logFirebaseEvent(
                                              'StackCardView_update_app_state');
                                          FFAppState().primary =
                                              colorFromCssString(
                                            startedItem.primaryColor,
                                            defaultColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                          );
                                          FFAppState().contrasting =
                                              colorFromCssString(
                                            startedItem.contrastingColor,
                                            defaultColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          );
                                          FFAppState().bodyTextColor =
                                              valueOrDefault<Color>(
                                            Theme.of(context).brightness ==
                                                    Brightness.light
                                                ? colorFromCssString(
                                                    startedItem.lightVibrant,
                                                    defaultColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                  )
                                                : colorFromCssString(
                                                    startedItem.darkVibrant,
                                                    defaultColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                  ),
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          );
                                          FFAppState().lightVibrant =
                                              colorFromCssString(
                                            startedItem.lightVibrant,
                                            defaultColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                          );
                                          FFAppState().darkVibrant =
                                              colorFromCssString(
                                            startedItem.darkVibrant,
                                            defaultColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          );
                                          logFirebaseEvent(
                                              'StackCardView_navigate_to');

                                          context.pushNamed(
                                            'Details',
                                            queryParameters: {
                                              'itemRef': serializeParam(
                                                startedItem.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'primary': serializeParam(
                                                colorFromCssString(
                                                  startedItem.primaryColor,
                                                  defaultColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                ),
                                                ParamType.Color,
                                              ),
                                              'contrasting': serializeParam(
                                                colorFromCssString(
                                                  startedItem.contrastingColor,
                                                  defaultColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                                ParamType.Color,
                                              ),
                                              'text': serializeParam(
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? colorFromCssString(
                                                        startedItem
                                                            .lightVibrant,
                                                        defaultColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                      )
                                                    : colorFromCssString(
                                                        startedItem.darkVibrant,
                                                        defaultColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                      ),
                                                ParamType.Color,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 38.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(8.0),
                                                  topRight:
                                                      Radius.circular(8.0),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 8.0, 12.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 2.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child: Container(
                                                                width: 60.0,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    1.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxHeight:
                                                                      100.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        Theme.of(context).brightness ==
                                                                                Brightness.light
                                                                            ? colorFromCssString(
                                                                                startedItem.lightVibrant,
                                                                                defaultColor: FlutterFlowTheme.of(context).white,
                                                                              )
                                                                            : colorFromCssString(
                                                                                startedItem.darkVibrant,
                                                                                defaultColor: Colors.black,
                                                                              ),
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Stack(
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        imageUrl:
                                                                            'https://www.connectio.com.au/grateful/loading.png',
                                                                        width:
                                                                            300.0,
                                                                        height:
                                                                            200.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      (startedItem.timestamp!.millisecondsSinceEpoch !=
                                                                              null &&
                                                                          (DateTime.now().millisecondsSinceEpoch - startedItem.timestamp!.millisecondsSinceEpoch) <
                                                                              600000),
                                                                      false,
                                                                    ))
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            LinearPercentIndicator(
                                                                          percent: (int
                                                                              dateTimeVariable) {
                                                                            return (dateTimeVariable != null && (DateTime.now().millisecondsSinceEpoch - dateTimeVariable) > 15000)
                                                                                ? 1.0
                                                                                : (dateTimeVariable != null ? (DateTime.now().millisecondsSinceEpoch - dateTimeVariable) / 30000 : 0.0);
                                                                          }(startedItem
                                                                              .timestamp!
                                                                              .millisecondsSinceEpoch),
                                                                          width:
                                                                              60.0,
                                                                          lineHeight:
                                                                              100.0,
                                                                          animation:
                                                                              true,
                                                                          progressColor:
                                                                              Color(0x82616161),
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                        ),
                                                                      ),
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      (startedItem.timestamp!.millisecondsSinceEpoch !=
                                                                              null &&
                                                                          (DateTime.now().millisecondsSinceEpoch - startedItem.timestamp!.millisecondsSinceEpoch) <
                                                                              600000),
                                                                      false,
                                                                    ))
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/3face8da2a6c3dcd27cb4a1aaa32c926_w200.gif',
                                                                            width:
                                                                                24.0,
                                                                            height:
                                                                                24.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .calendar_today_rounded,
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            FFAppState().contrasting,
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        dateTimeFormat(
                                                                          'MMMEd',
                                                                          startedItem
                                                                              .timestamp!,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: valueOrDefault<Color>(
                                                                                FFAppState().contrasting,
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                              fontSize: 12.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          dateTimeFormat(
                                                                            'jm',
                                                                            startedItem.timestamp!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: valueOrDefault<Color>(
                                                                                  FFAppState().contrasting,
                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                                fontSize: 10.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .chevron_right_rounded,
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      FFAppState()
                                                                          .contrasting,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
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
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          AutoSizeText(
                                                                            startedItem.itemText,
                                                                            maxLines:
                                                                                3,
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: 'Aldo',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
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
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (valueOrDefault<
                                                                              bool>(
                                                                            startedItem.location !=
                                                                                null,
                                                                            false,
                                                                          ))
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.location_on,
                                                                                color: valueOrDefault<Color>(
                                                                                  Theme.of(context).brightness == Brightness.dark
                                                                                      ? colorFromCssString(
                                                                                          startedItem.lightVibrant,
                                                                                          defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                        )
                                                                                      : colorFromCssString(
                                                                                          startedItem.darkVibrant,
                                                                                          defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                        ),
                                                                                  FlutterFlowTheme.of(context).secondaryText,
                                                                                ),
                                                                                size: 20.0,
                                                                              ),
                                                                            ),
                                                                          if (valueOrDefault<
                                                                              bool>(
                                                                            startedItem.uploadedImages.image != null &&
                                                                                startedItem.uploadedImages.image != '',
                                                                            false,
                                                                          ))
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.photo_outlined,
                                                                                color: valueOrDefault<Color>(
                                                                                  Theme.of(context).brightness == Brightness.dark
                                                                                      ? colorFromCssString(
                                                                                          startedItem.lightVibrant,
                                                                                          defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                        )
                                                                                      : colorFromCssString(
                                                                                          startedItem.darkVibrant,
                                                                                          defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                        ),
                                                                                  FlutterFlowTheme.of(context).secondaryText,
                                                                                ),
                                                                                size: 20.0,
                                                                              ),
                                                                            ),
                                                                          if (valueOrDefault<
                                                                              bool>(
                                                                            startedItem.uploadedImages.selfie != null &&
                                                                                startedItem.uploadedImages.selfie != '',
                                                                            false,
                                                                          ))
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.portrait_rounded,
                                                                                color: valueOrDefault<Color>(
                                                                                  Theme.of(context).brightness == Brightness.dark
                                                                                      ? colorFromCssString(
                                                                                          startedItem.lightVibrant,
                                                                                          defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                        )
                                                                                      : colorFromCssString(
                                                                                          startedItem.darkVibrant,
                                                                                          defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                        ),
                                                                                  FlutterFlowTheme.of(context).secondaryText,
                                                                                ),
                                                                                size: 20.0,
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
                          if (valueOrDefault<bool>(
                            FFAppState().showListView == true,
                            true,
                          ))
                            Builder(
                              builder: (context) {
                                final items = entriesItemRecordList
                                    .where((e) => e.status == 'Success')
                                    .toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: items.length,
                                  itemBuilder: (context, itemsIndex) {
                                    final itemsItem = items[itemsIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 8.0),
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 4.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'ENTRIES_PAGE_StackCardView_ON_TAP');
                                            logFirebaseEvent(
                                                'StackCardView_update_app_state');
                                            FFAppState().primary =
                                                colorFromCssString(
                                              itemsItem.primaryColor,
                                              defaultColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            );
                                            FFAppState().contrasting =
                                                colorFromCssString(
                                              itemsItem.contrastingColor,
                                              defaultColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            );
                                            FFAppState().bodyTextColor =
                                                valueOrDefault<Color>(
                                              Theme.of(context).brightness ==
                                                      Brightness.light
                                                  ? colorFromCssString(
                                                      itemsItem.lightVibrant,
                                                      defaultColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                    )
                                                  : colorFromCssString(
                                                      itemsItem.darkVibrant,
                                                      defaultColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                    ),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            );
                                            FFAppState().lightVibrant =
                                                colorFromCssString(
                                              itemsItem.lightVibrant,
                                              defaultColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            );
                                            FFAppState().darkVibrant =
                                                colorFromCssString(
                                              itemsItem.darkVibrant,
                                              defaultColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            );
                                            logFirebaseEvent(
                                                'StackCardView_navigate_to');

                                            context.pushNamed(
                                              'Details',
                                              queryParameters: {
                                                'itemRef': serializeParam(
                                                  itemsItem.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'primary': serializeParam(
                                                  colorFromCssString(
                                                    itemsItem.primaryColor,
                                                    defaultColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                  ),
                                                  ParamType.Color,
                                                ),
                                                'contrasting': serializeParam(
                                                  colorFromCssString(
                                                    itemsItem.contrastingColor,
                                                    defaultColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                  ParamType.Color,
                                                ),
                                                'text': serializeParam(
                                                  Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? colorFromCssString(
                                                          itemsItem
                                                              .lightVibrant,
                                                          defaultColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                        )
                                                      : colorFromCssString(
                                                          itemsItem.darkVibrant,
                                                          defaultColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                        ),
                                                  ParamType.Color,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 38.0,
                                                decoration: BoxDecoration(
                                                  color: colorFromCssString(
                                                    itemsItem.primaryColor,
                                                    defaultColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(8.0),
                                                    topRight:
                                                        Radius.circular(8.0),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 8.0,
                                                                12.0, 12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
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
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    1.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxHeight:
                                                                      100.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        Theme.of(context).brightness ==
                                                                                Brightness.light
                                                                            ? colorFromCssString(
                                                                                itemsItem.lightVibrant,
                                                                                defaultColor: FlutterFlowTheme.of(context).white,
                                                                              )
                                                                            : colorFromCssString(
                                                                                itemsItem.darkVibrant,
                                                                                defaultColor: Colors.black,
                                                                              ),
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Stack(
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        imageUrl:
                                                                            valueOrDefault<String>(
                                                                          itemsItem
                                                                              .mainImage,
                                                                          'https://www.connectio.com.au/grateful/loading.png',
                                                                        ),
                                                                        width:
                                                                            300.0,
                                                                        height:
                                                                            200.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.calendar_today_rounded,
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              FFAppState().contrasting,
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            'MMMEd',
                                                                            itemsItem.timestamp!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: valueOrDefault<Color>(
                                                                                  FFAppState().contrasting,
                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            dateTimeFormat(
                                                                              'jm',
                                                                              itemsItem.timestamp!,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  color: valueOrDefault<Color>(
                                                                                    FFAppState().contrasting,
                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                  fontSize: 10.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .chevron_right_rounded,
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        FFAppState()
                                                                            .contrasting,
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
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
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            AutoSizeText(
                                                                              itemsItem.itemText,
                                                                              maxLines: 3,
                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                    fontFamily: 'Aldo',
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            if (valueOrDefault<bool>(
                                                                              itemsItem.location != null,
                                                                              false,
                                                                            ))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.location_on,
                                                                                  color: valueOrDefault<Color>(
                                                                                    Theme.of(context).brightness == Brightness.dark
                                                                                        ? colorFromCssString(
                                                                                            itemsItem.lightVibrant,
                                                                                            defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                          )
                                                                                        : colorFromCssString(
                                                                                            itemsItem.darkVibrant,
                                                                                            defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                          ),
                                                                                    FlutterFlowTheme.of(context).secondaryText,
                                                                                  ),
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                            if (valueOrDefault<bool>(
                                                                              itemsItem.uploadedImages.image != null && itemsItem.uploadedImages.image != '',
                                                                              false,
                                                                            ))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.photo_outlined,
                                                                                  color: valueOrDefault<Color>(
                                                                                    Theme.of(context).brightness == Brightness.dark
                                                                                        ? colorFromCssString(
                                                                                            itemsItem.lightVibrant,
                                                                                            defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                          )
                                                                                        : colorFromCssString(
                                                                                            itemsItem.darkVibrant,
                                                                                            defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                          ),
                                                                                    FlutterFlowTheme.of(context).secondaryText,
                                                                                  ),
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                            if (valueOrDefault<bool>(
                                                                              itemsItem.uploadedImages.selfie != null && itemsItem.uploadedImages.selfie != '',
                                                                              false,
                                                                            ))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.portrait_rounded,
                                                                                  color: valueOrDefault<Color>(
                                                                                    Theme.of(context).brightness == Brightness.dark
                                                                                        ? colorFromCssString(
                                                                                            itemsItem.lightVibrant,
                                                                                            defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                          )
                                                                                        : colorFromCssString(
                                                                                            itemsItem.darkVibrant,
                                                                                            defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                          ),
                                                                                    FlutterFlowTheme.of(context).secondaryText,
                                                                                  ),
                                                                                  size: 20.0,
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
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'ENTRIES_PAGE_DELETE_BTN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Button_backend_call');
                                                            await itemsItem
                                                                .reference
                                                                .delete();
                                                          },
                                                          text: 'Delete',
                                                          icon: Icon(
                                                            Icons
                                                                .delete_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
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
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.0),
                                                          ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'ENTRIES_PAGE_SHARE_BTN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Button_custom_action');
                                                            await actions
                                                                .shareFirebaseImage(
                                                              valueOrDefault<
                                                                  String>(
                                                                itemsItem.stableImg2Img !=
                                                                            null &&
                                                                        itemsItem.stableImg2Img !=
                                                                            ''
                                                                    ? itemsItem
                                                                        .stableImg2Img
                                                                    : valueOrDefault<
                                                                        String>(
                                                                        itemsItem
                                                                            .mainImage,
                                                                        '0',
                                                                      ),
                                                                '#',
                                                              ),
                                                              itemsItem
                                                                  .itemText,
                                                            );
                                                          },
                                                          text: 'Share',
                                                          icon: Icon(
                                                            Icons.share_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
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
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.0),
                                                          ),
                                                        ),
                                                        Builder(
                                                          builder: (context) =>
                                                              FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'ENTRIES_PAGE__BTN_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Button_alert_dialog');
                                                              showAlignedDialog(
                                                                barrierColor: Color(
                                                                    0x7F000000),
                                                                context:
                                                                    context,
                                                                isGlobal: false,
                                                                avoidOverflow:
                                                                    true,
                                                                targetAnchor:
                                                                    AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                followerAnchor:
                                                                    AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    child:
                                                                        MoreDropdownWidget(
                                                                      item:
                                                                          itemsItem,
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));
                                                            },
                                                            text: '',
                                                            icon: Icon(
                                                              Icons
                                                                  .more_vert_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                              elevation: 2.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
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
                          if (valueOrDefault<bool>(
                            FFAppState().showListView == false,
                            false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 16.0),
                              child: Builder(
                                builder: (context) {
                                  final itemsGrid = entriesItemRecordList
                                      .map((e) => e)
                                      .toList()
                                      .where((e) => e.status == 'Success')
                                      .toList();
                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 8.0,
                                      childAspectRatio: 0.7,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: itemsGrid.length,
                                    itemBuilder: (context, itemsGridIndex) {
                                      final itemsGridItem =
                                          itemsGrid[itemsGridIndex];
                                      return Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'ENTRIES_PAGE_Image_4klmyf5k_ON_TAP');
                                            logFirebaseEvent(
                                                'Image_navigate_to');

                                            context.pushNamed(
                                              'Details',
                                              queryParameters: {
                                                'itemRef': serializeParam(
                                                  itemsGridItem.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'primary': serializeParam(
                                                  colorFromCssString(
                                                    itemsGridItem.primaryColor,
                                                    defaultColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                  ),
                                                  ParamType.Color,
                                                ),
                                                'contrasting': serializeParam(
                                                  colorFromCssString(
                                                    itemsGridItem
                                                        .contrastingColor,
                                                    defaultColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                  ParamType.Color,
                                                ),
                                                'text': serializeParam(
                                                  Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? colorFromCssString(
                                                          itemsGridItem
                                                              .lightVibrant,
                                                          defaultColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                        )
                                                      : colorFromCssString(
                                                          itemsGridItem
                                                              .darkVibrant,
                                                          defaultColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                        ),
                                                  ParamType.Color,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          onLongPress: () async {
                                            logFirebaseEvent(
                                                'ENTRIES_Image_4klmyf5k_ON_LONG_PRESS');
                                            logFirebaseEvent(
                                                'Image_alert_dialog');
                                            showAlignedDialog(
                                              context: context,
                                              isGlobal: false,
                                              avoidOverflow: true,
                                              targetAnchor:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              followerAnchor:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              builder: (dialogContext) {
                                                return Material(
                                                  color: Colors.transparent,
                                                  child: MoreDropdownWidget(
                                                    item: itemsGridItem,
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: CachedNetworkImage(
                                              imageUrl: valueOrDefault<String>(
                                                itemsGridItem.mainImage,
                                                'https://www.connectio.com.au/grateful/loading.png',
                                              ),
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.5,
                                              fit: BoxFit.cover,
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
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => setState(() {}),
                  updateOnChange: true,
                  child: NavBarWidget(
                    activePage: 'Entries',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
