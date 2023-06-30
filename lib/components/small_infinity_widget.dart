import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'small_infinity_model.dart';
export 'small_infinity_model.dart';

class SmallInfinityWidget extends StatefulWidget {
  const SmallInfinityWidget({
    Key? key,
    required this.infinUrl,
    required this.infinUrlDark,
  }) : super(key: key);

  final String? infinUrl;
  final String? infinUrlDark;

  @override
  _SmallInfinityWidgetState createState() => _SmallInfinityWidgetState();
}

class _SmallInfinityWidgetState extends State<SmallInfinityWidget> {
  late SmallInfinityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmallInfinityModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 6.0,
      shape: const CircleBorder(),
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            Theme.of(context).brightness == Brightness.dark
                ? FlutterFlowTheme.of(context).lineColor
                : FlutterFlowTheme.of(context).accent3,
            FlutterFlowTheme.of(context).accent3,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: Image.network(
              Theme.of(context).brightness == Brightness.dark
                  ? valueOrDefault<String>(
                      widget.infinUrlDark,
                      'https://www.connectio.com.au/grateful/infin/3W.png',
                    )
                  : valueOrDefault<String>(
                      widget.infinUrl,
                      'https://www.connectio.com.au/grateful/infin/3B.png',
                    ),
              width: 24.0,
              height: 24.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
