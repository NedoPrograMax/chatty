import '/auth/firebase_auth/auth_util.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'profile_image_picker_model.dart';
export 'profile_image_picker_model.dart';

class ProfileImagePickerWidget extends StatefulWidget {
  const ProfileImagePickerWidget({super.key});

  @override
  _ProfileImagePickerWidgetState createState() =>
      _ProfileImagePickerWidgetState();
}

class _ProfileImagePickerWidgetState extends State<ProfileImagePickerWidget> {
  late ProfileImagePickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileImagePickerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.00, 0.00),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          final selectedMedia = await selectMedia(
            mediaSource: MediaSource.photoGallery,
            multiImage: false,
          );
          if (selectedMedia != null &&
              selectedMedia
                  .every((m) => validateFileFormat(m.storagePath, context))) {
            setState(() => _model.isDataUploading = true);
            var selectedUploadedFiles = <FFUploadedFile>[];

            var downloadUrls = <String>[];
            try {
              selectedUploadedFiles = selectedMedia
                  .map((m) => FFUploadedFile(
                        name: m.storagePath.split('/').last,
                        bytes: m.bytes,
                        height: m.dimensions?.height,
                        width: m.dimensions?.width,
                        blurHash: m.blurHash,
                      ))
                  .toList();

              downloadUrls = (await Future.wait(
                selectedMedia.map(
                  (m) async => await uploadData(m.storagePath, m.bytes),
                ),
              ))
                  .where((u) => u != null)
                  .map((u) => u!)
                  .toList();
            } finally {
              _model.isDataUploading = false;
            }
            if (selectedUploadedFiles.length == selectedMedia.length &&
                downloadUrls.length == selectedMedia.length) {
              setState(() {
                _model.uploadedLocalFile = selectedUploadedFiles.first;
                _model.uploadedFileUrl = downloadUrls.first;
              });
            } else {
              setState(() {});
              return;
            }
          }
        },
        child: Builder(
          builder: (context) {
            if ((_model.uploadedFileUrl != '') ||
                (currentUserPhoto != '')) {
              return Container(
                width: 120.0,
                height: 120.0,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  () {
                    if (_model.uploadedFileUrl != '') {
                      return _model.uploadedFileUrl;
                    } else if (currentUserPhoto != '') {
                      return currentUserPhoto;
                    } else {
                      return 'https://firebasestorage.googleapis.com/v0/b/chatty-wkoppk.appspot.com/o/UserPlus.svg?alt=media&token=20e3bc23-ead7-4a25-8319-e5e599e60067';
                    }
                  }(),
                  fit: BoxFit.cover,
                ),
              );
            } else {
              return Icon(
                Icons.person_sharp,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 120.0,
              );
            }
          },
        ),
      ),
    );
  }
}
