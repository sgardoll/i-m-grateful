import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_list_model.dart';
export 'empty_list_model.dart';

class EmptyListWidget extends StatefulWidget {
  const EmptyListWidget({Key? key}) : super(key: key);

  @override
  _EmptyListWidgetState createState() => _EmptyListWidgetState();
}

class _EmptyListWidgetState extends State<EmptyListWidget> {
  late EmptyListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? 'assets/images/dark.png'
                    : 'assets/images/light.png',
              ).image,
            ),
            border: Border.all(
              width: 0.0,
            ),
          ),
        ),
        ClipRect(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: 48.0,
              sigmaY: 48.0,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 90.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300.0,
                    height: 146.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).primaryBackground,
                          Color(0x00FFFFFF)
                        ],
                        stops: [0.9, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 48.0, 24.0, 0.0),
                    child: Text(
                      'Your gratitude list is currently empty. \n\nAdd an entry using the',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'EMPTY_LIST_COMP_Icon_r8er4fna_ON_TAP');
                        logFirebaseEvent('Icon_navigate_to');

                        context.pushNamed('NewItem');
                      },
                      child: Icon(
                        Icons.add_circle,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 48.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                    child: Text(
                      'button below',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).primaryText,
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
  }
}
