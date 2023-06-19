import '/components/unlimited_circle_widget.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InfinityFeatureModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for UnlimitedCircle component.
  late UnlimitedCircleModel unlimitedCircleModel;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? revenueCatConfirmPurchase;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    unlimitedCircleModel = createModel(context, () => UnlimitedCircleModel());
  }

  void dispose() {
    unlimitedCircleModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
