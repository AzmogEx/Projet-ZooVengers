import '/flutter_flow/flutter_flow_util.dart';
import 'start_widget.dart' show StartWidget;
import 'package:flutter/material.dart';

class StartModel extends FlutterFlowModel<StartWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
