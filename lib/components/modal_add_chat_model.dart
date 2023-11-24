import '/backend/backend.dart';
import '/components/user_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'modal_add_chat_widget.dart' show ModalAddChatWidget;
import 'package:flutter/material.dart';

class ModalAddChatModel extends FlutterFlowModel<ModalAddChatWidget> {
  ///  Local state fields for this component.

  UsersRecord? user;

  ///  State fields for stateful widgets in this component.

  // Model for UserRow component.
  late UserRowModel userRowModel;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in yourName widget.
  UsersRecord? userDoc;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    userRowModel = createModel(context, () => UserRowModel());
  }

  @override
  void dispose() {
    userRowModel.dispose();
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
