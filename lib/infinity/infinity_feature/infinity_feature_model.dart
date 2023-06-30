import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/infinity/page_view_chewie/page_view_chewie_widget.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InfinityFeatureModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for PageViewChewie component.
  late PageViewChewieModel pageViewChewieModel;
  // State field(s) for Checkbox-6mth widget.
  bool? checkbox6mthValue;
  // State field(s) for Checkbox-12mth widget.
  bool? checkbox12mthValue;
  // State field(s) for Checkbox-1mth widget.
  bool? checkbox1mthValue;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? revenueCatConfirmPurchase;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pageViewChewieModel = createModel(context, () => PageViewChewieModel());
  }

  void dispose() {
    pageViewChewieModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
