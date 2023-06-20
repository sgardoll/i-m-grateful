import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'unlimited_circle_model.dart';
export 'unlimited_circle_model.dart';

class UnlimitedCircleWidget extends StatefulWidget {
  const UnlimitedCircleWidget({Key? key}) : super(key: key);

  @override
  _UnlimitedCircleWidgetState createState() => _UnlimitedCircleWidgetState();
}

class _UnlimitedCircleWidgetState extends State<UnlimitedCircleWidget> {
  late UnlimitedCircleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UnlimitedCircleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).alternate,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 2.0),
          )
        ],
        shape: BoxShape.circle,
      ),
      child: Icon(
        FFIcons.kinfinity,
        color: FlutterFlowTheme.of(context).primaryText,
        size: 15.0,
      ),
    );
  }
}
