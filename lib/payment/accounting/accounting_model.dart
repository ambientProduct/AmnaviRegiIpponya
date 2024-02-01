import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/payment/custom_menu_component/custom_menu_component_widget.dart';
import '/payment/divide_component/divide_component_widget.dart';
import '/payment/numbers_component/numbers_component_widget.dart';
import '/payment/pay_component/pay_component_widget.dart';
import '/payment/waribiki/waribiki_widget.dart';
import 'accounting_widget.dart' show AccountingWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountingModel extends FlutterFlowModel<AccountingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
