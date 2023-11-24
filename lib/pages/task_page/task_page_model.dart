import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'task_page_widget.dart' show TaskPageWidget;
import 'package:flutter/material.dart';

class TaskPageModel extends FlutterFlowModel<TaskPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? firstUser;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
