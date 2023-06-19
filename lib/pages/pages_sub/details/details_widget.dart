import '/backend/backend.dart';
import '/components/image_selfie_widget.dart';
import '/components/location_widget.dart';
import '/components/more_dropdown_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'details_model.dart';
export 'details_model.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({
    Key? key,
    required this.itemRef,
    Color? primary,
    Color? contrasting,
    Color? text,
  })  : this.primary = primary ?? const Color(0xFFFCB769),
        this.contrasting = contrasting ?? const Color(0xFF406C88),
        this.text = text ?? const Color(0x1AFFFFFF),
        super(key: key);

  final DocumentReference? itemRef;
  final Color primary;
  final Color contrasting;
  final Color text;

  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  late DetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Details'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DETAILS_PAGE_Details_ON_INIT_STATE');
      logFirebaseEvent('Details_update_app_state');
      setState(() {
        FFAppState().primary = widget.primary;
        FFAppState().contrasting = widget.contrasting;
        FFAppState().bodyTextColor = widget.text;
      });
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

    return StreamBuilder<ItemRecord>(
      stream: ItemRecord.getDocument(widget.itemRef!),
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
        final detailsItemRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Stack(
            children: [
              Builder(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('DETAILS_PAGE_Image_d3kjgi3m_ON_TAP');
                    logFirebaseEvent('Image_expand_image');
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: FlutterFlowExpandedImageView(
                          image: Image.network(
                            valueOrDefault<String>(
                              detailsItemRecord.stable.imageUrls.first,
                              '0',
                            ),
                            fit: BoxFit.contain,
                          ),
                          allowRotation: false,
                          tag: valueOrDefault<String>(
                            detailsItemRecord.stable.imageUrls.first,
                            '0',
                          ),
                          useHeroAnimation: true,
                        ),
                      ),
                    );
                  },
                  onLongPress: () async {
                    logFirebaseEvent('DETAILS_Image_d3kjgi3m_ON_LONG_PRESS');
                    logFirebaseEvent('Image_alert_dialog');
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
                            item: detailsItemRecord,
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: Hero(
                    tag: valueOrDefault<String>(
                      detailsItemRecord.stable.imageUrls.first,
                      '0',
                    ),
                    transitionOnUserGestures: true,
                    child: Image.network(
                      valueOrDefault<String>(
                        detailsItemRecord.stable.imageUrls.first,
                        '0',
                      ),
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.height * 1.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              if (valueOrDefault<bool>(
                detailsItemRecord.stableImg2Img != null &&
                    detailsItemRecord.stableImg2Img != '',
                false,
              ))
                Builder(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('DETAILS_PAGE_StableImg2Img_ON_TAP');
                      logFirebaseEvent('StableImg2Img_expand_image');
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: FlutterFlowExpandedImageView(
                            image: CachedNetworkImage(
                              imageUrl: valueOrDefault<String>(
                                detailsItemRecord.stableImg2Img,
                                '0',
                              ),
                              fit: BoxFit.contain,
                            ),
                            allowRotation: true,
                            tag: valueOrDefault<String>(
                              detailsItemRecord.stableImg2Img,
                              '0',
                            ),
                            useHeroAnimation: true,
                          ),
                        ),
                      );
                    },
                    onLongPress: () async {
                      logFirebaseEvent(
                          'DETAILS_PAGE_StableImg2Img_ON_LONG_PRESS');
                      logFirebaseEvent('StableImg2Img_alert_dialog');
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
                              item: detailsItemRecord,
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: Hero(
                      tag: valueOrDefault<String>(
                        detailsItemRecord.stableImg2Img,
                        '0',
                      ),
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: CachedNetworkImage(
                          imageUrl: valueOrDefault<String>(
                            detailsItemRecord.stableImg2Img,
                            '0',
                          ),
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: MediaQuery.of(context).size.height * 1.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              if (valueOrDefault<bool>(
                detailsItemRecord.instructPix2Pix != null &&
                    detailsItemRecord.instructPix2Pix != '',
                false,
              ))
                Builder(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('DETAILS_PAGE_StableImg2Img_ON_TAP');
                      logFirebaseEvent('StableImg2Img_expand_image');
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: FlutterFlowExpandedImageView(
                            image: CachedNetworkImage(
                              imageUrl: valueOrDefault<String>(
                                detailsItemRecord.instructPix2Pix,
                                '0',
                              ),
                              fit: BoxFit.contain,
                            ),
                            allowRotation: true,
                            tag: valueOrDefault<String>(
                              detailsItemRecord.instructPix2Pix,
                              '0',
                            ),
                            useHeroAnimation: true,
                          ),
                        ),
                      );
                    },
                    onLongPress: () async {
                      logFirebaseEvent(
                          'DETAILS_PAGE_StableImg2Img_ON_LONG_PRESS');
                      logFirebaseEvent('StableImg2Img_alert_dialog');
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
                              item: detailsItemRecord,
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: Hero(
                      tag: valueOrDefault<String>(
                        detailsItemRecord.instructPix2Pix,
                        '0',
                      ),
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: CachedNetworkImage(
                          imageUrl: valueOrDefault<String>(
                            detailsItemRecord.instructPix2Pix,
                            '0',
                          ),
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: MediaQuery.of(context).size.height * 1.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 2.0,
                        sigmaY: 2.0,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: MediaQuery.of(context).size.height * 0.161,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).primaryBackground,
                              Color(0x00FFFFFF)
                            ],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: valueOrDefault<Color>(
                          FFAppState().contrasting,
                          FlutterFlowTheme.of(context).secondary,
                        ),
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'DETAILS_arrow_back_rounded_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.safePop();
                      },
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            dateTimeFormat(
                                'MMMEd', detailsItemRecord.timestamp!),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: valueOrDefault<Color>(
                                    FFAppState().contrasting,
                                    FlutterFlowTheme.of(context).secondary,
                                  ),
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 4.0, 0.0, 0.0),
                            child: Text(
                              dateTimeFormat(
                                  'jm', detailsItemRecord.timestamp!),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: valueOrDefault<Color>(
                                      FFAppState().contrasting,
                                      FlutterFlowTheme.of(context).secondary,
                                    ),
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Builder(
                      builder: (context) => FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.more_vert_rounded,
                          color: valueOrDefault<Color>(
                            FFAppState().contrasting,
                            FlutterFlowTheme.of(context).secondary,
                          ),
                          size: 30.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'DETAILS_more_vert_rounded_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_alert_dialog');
                          showAlignedDialog(
                            barrierColor: Color(0x7F000000),
                            context: context,
                            isGlobal: false,
                            avoidOverflow: true,
                            targetAnchor: AlignmentDirectional(1.0, -1.0)
                                .resolve(Directionality.of(context)),
                            followerAnchor: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            builder: (dialogContext) {
                              return Material(
                                color: Colors.transparent,
                                child: MoreDropdownWidget(
                                  item: detailsItemRecord,
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0),
                              ),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 2.0,
                                  sigmaY: 2.0,
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0x00FFFFFF),
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground
                                      ],
                                      stops: [0.0, 0.5],
                                      begin: AlignmentDirectional(0.0, -1.0),
                                      end: AlignmentDirectional(0, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 100.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: AutoSizeText(
                                        detailsItemRecord.itemText,
                                        maxLines: 9,
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Roboto Condensed',
                                              color: widget.primary,
                                              fontSize: 45.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (valueOrDefault<bool>(
                                detailsItemRecord.moreText != null &&
                                    detailsItemRecord.moreText != '',
                                false,
                              ))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: AutoSizeText(
                                          detailsItemRecord.moreText,
                                          maxLines: 10,
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Roboto Condensed',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 20.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.format_paint_rounded,
                                      color: valueOrDefault<Color>(
                                        widget.contrasting,
                                        FlutterFlowTheme.of(context).secondary,
                                      ),
                                      size: 20.0,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: AutoSizeText(
                                          detailsItemRecord.style,
                                          maxLines: 10,
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: valueOrDefault<Color>(
                                                  widget.contrasting,
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                                ),
                                              ),
                                        ),
                                      ),
                                    ),
                                    if (valueOrDefault<bool>(
                                      detailsItemRecord.location != null,
                                      false,
                                    ))
                                      FlutterFlowIconButton(
                                        borderColor: valueOrDefault<Color>(
                                          widget.primary,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        borderRadius: 20.0,
                                        borderWidth: 2.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.location_on_outlined,
                                          color: valueOrDefault<Color>(
                                            widget.contrasting,
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'DETAILS_PAGE_locationButton_ON_TAP');
                                          logFirebaseEvent(
                                              'locationButton_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: Color(0x80000000),
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.85,
                                                  child: LocationWidget(
                                                    location: detailsItemRecord
                                                        .location!,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                      ),
                                    if (valueOrDefault<bool>(
                                      detailsItemRecord.uploadedImages.image !=
                                              null &&
                                          detailsItemRecord
                                                  .uploadedImages.image !=
                                              '',
                                      false,
                                    ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: valueOrDefault<Color>(
                                            widget.primary,
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          borderRadius: 20.0,
                                          borderWidth: 2.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.photo_outlined,
                                            color: valueOrDefault<Color>(
                                              widget.contrasting,
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                            ),
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'DETAILS_PAGE_locationButton_ON_TAP');
                                            logFirebaseEvent(
                                                'locationButton_bottom_sheet');
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: Color(0x80000000),
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.85,
                                                    child: ImageSelfieWidget(
                                                      imageSelfie:
                                                          detailsItemRecord
                                                              .uploadedImages
                                                              .image,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                        ),
                                      ),
                                    if (valueOrDefault<bool>(
                                      detailsItemRecord.uploadedImages.selfie !=
                                              null &&
                                          detailsItemRecord
                                                  .uploadedImages.selfie !=
                                              '',
                                      false,
                                    ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: valueOrDefault<Color>(
                                            widget.primary,
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          borderRadius: 20.0,
                                          borderWidth: 2.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.portrait_rounded,
                                            color: valueOrDefault<Color>(
                                              widget.contrasting,
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                            ),
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'DETAILS_PAGE_locationButton_ON_TAP');
                                            logFirebaseEvent(
                                                'locationButton_bottom_sheet');
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: Color(0x7F000000),
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: ImageSelfieWidget(
                                                    imageSelfie:
                                                        detailsItemRecord
                                                            .uploadedImages
                                                            .selfie,
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
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
                ],
              ),
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
        );
      },
    );
  }
}
