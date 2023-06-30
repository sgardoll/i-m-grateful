import '/flutter_flow/flutter_flow_rive_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'check_animation_model.dart';
export 'check_animation_model.dart';

class CheckAnimationWidget extends StatefulWidget {
  const CheckAnimationWidget({Key? key}) : super(key: key);

  @override
  _CheckAnimationWidgetState createState() => _CheckAnimationWidgetState();
}

class _CheckAnimationWidgetState extends State<CheckAnimationWidget> {
  late CheckAnimationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckAnimationModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: 24.0,
            height: 24.0,
            child: RiveAnimation.asset(
              'assets/rive_animations/tickHalfspeed.riv',
              artboard: 'check_animation',
              fit: BoxFit.contain,
              controllers: _model.riveAnimationControllers,
            ),
          ),
        ),
      ),
    );
  }
}
