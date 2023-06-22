import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_stack_model.dart';
export 'item_stack_model.dart';

class ItemStackWidget extends StatefulWidget {
  const ItemStackWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemRecord? item;

  @override
  _ItemStackWidgetState createState() => _ItemStackWidgetState();
}

class _ItemStackWidgetState extends State<ItemStackWidget> {
  late ItemStackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemStackModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ITEM_STACK_COMP_ItemStack_ON_INIT_STATE');
      logFirebaseEvent('ItemStack_update_app_state');
      _model.updatePage(() {
        FFAppState().primary = colorFromCssString(
          widget.item!.primaryColor,
          defaultColor: FlutterFlowTheme.of(context).primary,
        );
        FFAppState().contrasting = colorFromCssString(
          widget.item!.contrastingColor,
          defaultColor: FlutterFlowTheme.of(context).secondary,
        );
        FFAppState().bodyTextColor = valueOrDefault<Color>(
          Theme.of(context).brightness == Brightness.light
              ? colorFromCssString(
                  widget.item!.lightVibrant,
                  defaultColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                )
              : colorFromCssString(
                  widget.item!.darkVibrant,
                  defaultColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                ),
          FlutterFlowTheme.of(context).secondaryBackground,
        );
        FFAppState().lightVibrant = colorFromCssString(
          widget.item!.lightVibrant,
          defaultColor: FlutterFlowTheme.of(context).secondaryText,
        );
        FFAppState().darkVibrant = colorFromCssString(
          widget.item!.darkVibrant,
          defaultColor: FlutterFlowTheme.of(context).primaryText,
        );
      });
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<ItemRecord>(
      stream: ItemRecord.getDocument(widget.item!.reference),
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
        final stackItemRecord = snapshot.data!;
        return Stack(
          children: [
            Hero(
              tag: valueOrDefault<String>(
                stackItemRecord.mainImage,
                'https://www.connectio.com.au/grateful/loading.png',
              ),
              transitionOnUserGestures: true,
              child: CachedNetworkImage(
                imageUrl: valueOrDefault<String>(
                  stackItemRecord.mainImage,
                  'https://www.connectio.com.au/grateful/loading.png',
                ),
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 1.0,
                fit: BoxFit.cover,
              ),
            ),
            Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ClipRect(
                          child: ImageFiltered(
                            imageFilter: ImageFilter.blur(
                              sigmaX: 4.0,
                              sigmaY: 4.0,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: custom_widgets.AnimatedText(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.8,
                                  text: stackItemRecord.itemText,
                                  fontSize: valueOrDefault<double>(
                                    functions.fontsize(
                                        MediaQuery.of(context).size.width * 0.6,
                                        stackItemRecord.itemText,
                                        MediaQuery.of(context).size.height *
                                            0.9),
                                    40.0,
                                  ),
                                  colour: valueOrDefault<Color>(
                                    FFAppState().lightVibrant,
                                    FlutterFlowTheme.of(context).secondaryText,
                                  ),
                                  fontFamily: 'Aldo',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: custom_widgets.AnimatedText(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.8,
                              text: stackItemRecord.itemText,
                              fontSize: valueOrDefault<double>(
                                functions.fontsize(
                                    MediaQuery.of(context).size.width * 0.6,
                                    stackItemRecord.itemText,
                                    MediaQuery.of(context).size.height * 0.9),
                                40.0,
                              ),
                              colour: valueOrDefault<Color>(
                                FFAppState().primary,
                                FlutterFlowTheme.of(context).primary,
                              ),
                              fontFamily: 'Aldo',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
