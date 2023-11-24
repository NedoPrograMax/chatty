import '/flutter_flow/flutter_flow_util.dart';
import 'profile_image_picker_widget.dart' show ProfileImagePickerWidget;
import 'package:flutter/material.dart';

class ProfileImagePickerModel
    extends FlutterFlowModel<ProfileImagePickerWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
