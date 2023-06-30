import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'timer_model.dart';
export 'timer_model.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    Key? key,
    this.parameter1,
    required this.timestamp,
    required this.docRef,
  }) : super(key: key);

  final int? parameter1;
  final DateTime? timestamp;
  final DocumentReference? docRef;

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late TimerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TIMER_COMP_timer_ON_INIT_STATE');
      logFirebaseEvent('timer_start_periodic_action');
      _model.TwoMinTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 12000),
        callback: (timer) async {
          if (_model.TwoMinTimer.isActive) {
            logFirebaseEvent('timer_wait__delay');
            await Future.delayed(const Duration(milliseconds: 12000));
            logFirebaseEvent('timer_firestore_query');
            _model.queryFirebase = await queryItemRecordOnce(
              queryBuilder: (itemRecord) => itemRecord
                  .where('userRef', isEqualTo: currentUserReference)
                  .orderBy('status')
                  .orderBy('timestamp'),
            );
          }
        },
        startImmediately: true,
      );
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

    return Visibility(
      visible: valueOrDefault<bool>(
        (widget.parameter1! != null &&
            (DateTime.now().millisecondsSinceEpoch - widget.parameter1!) <
                600000),
        false,
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/3face8da2a6c3dcd27cb4a1aaa32c926_w200.gif',
            width: 24.0,
            height: 24.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
