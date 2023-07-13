import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/infinity/key_selling_point/key_selling_point_widget.dart';
import 'dart:ui';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InfinityFeatureModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String? numMonths = '6';

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for keySellingPoint component.
  late KeySellingPointModel keySellingPointModel1;
  // Model for keySellingPoint component.
  late KeySellingPointModel keySellingPointModel2;
  // Model for keySellingPoint component.
  late KeySellingPointModel keySellingPointModel3;
  // Model for keySellingPoint component.
  late KeySellingPointModel keySellingPointModel4;
  // State field(s) for Checkbox-6mth widget.
  bool? checkbox6mthValue;
  // State field(s) for Checkbox-12mth widget.
  bool? checkbox12mthValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    keySellingPointModel1 = createModel(context, () => KeySellingPointModel());
    keySellingPointModel2 = createModel(context, () => KeySellingPointModel());
    keySellingPointModel3 = createModel(context, () => KeySellingPointModel());
    keySellingPointModel4 = createModel(context, () => KeySellingPointModel());
  }

  void dispose() {
    keySellingPointModel1.dispose();
    keySellingPointModel2.dispose();
    keySellingPointModel3.dispose();
    keySellingPointModel4.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
