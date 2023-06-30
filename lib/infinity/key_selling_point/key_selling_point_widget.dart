import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'key_selling_point_model.dart';
export 'key_selling_point_model.dart';

class KeySellingPointWidget extends StatefulWidget {
  const KeySellingPointWidget({
    Key? key,
    required this.heading,
    required this.copy,
    required this.icon,
  }) : super(key: key);

  final String? heading;
  final String? copy;
  final String? icon;

  @override
  _KeySellingPointWidgetState createState() => _KeySellingPointWidgetState();
}

class _KeySellingPointWidgetState extends State<KeySellingPointWidget> {
  late KeySellingPointModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KeySellingPointModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
      child: Material(
        color: Colors.transparent,
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: FlutterFlowTheme.of(context).alternate,
                offset: Offset(0.0, 2.0),
              )
            ],
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (valueOrDefault<bool>(
                    widget.icon == 'cal',
                    false,
                  ))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Icon(
                        Icons.edit_calendar_rounded,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                    ),
                  if (valueOrDefault<bool>(
                    widget.icon == 'sty',
                    false,
                  ))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Icon(
                        Icons.format_paint_rounded,
                        color: FlutterFlowTheme.of(context).warning,
                        size: 24.0,
                      ),
                    ),
                  if (valueOrDefault<bool>(
                    widget.icon == 'exp',
                    false,
                  ))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Icon(
                        Icons.explore_rounded,
                        color: FlutterFlowTheme.of(context).warning,
                        size: 24.0,
                      ),
                    ),
                  if (valueOrDefault<bool>(
                    widget.icon == 'reg',
                    false,
                  ))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Icon(
                        Icons.rotate_left,
                        color: FlutterFlowTheme.of(context).warning,
                        size: 24.0,
                      ),
                    ),
                  Flexible(
                    child: Text(
                      widget.heading!,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).labelLarge,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      widget.copy!,
                      textAlign: TextAlign.center,
                      maxLines: 10,
                      style: FlutterFlowTheme.of(context).labelSmall,
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
