import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../data/api/api_path.dart';
import '../../data/api/asset/data/upload_asset.dart';
import '../../theme/app_colors.dart';

class AppHtmlEditor extends StatelessWidget {
  const AppHtmlEditor({
    super.key,
    required this.editorController,
    this.initialText,
    required this.hint,
  });

  final String? initialText;
  final String hint;
  final HtmlEditorController editorController;

  @override
  Widget build(BuildContext context) {
    return HtmlEditor(
      controller: editorController,
      htmlEditorOptions: HtmlEditorOptions(
        hint: hint,
        shouldEnsureVisible: false,
        initialText: initialText,
      ),
      htmlToolbarOptions: HtmlToolbarOptions(
        toolbarPosition: ToolbarPosition.aboveEditor,
        toolbarType: ToolbarType.nativeScrollable,
        mediaLinkInsertInterceptor: (String url, InsertFileType type) {
          return true;
        },
        mediaUploadInterceptor: (PlatformFile file, InsertFileType type) async {
          final response = await uploadAsset(bytes: file.bytes?.toList(), fileName: file.name);
          if (response.data != null) {
            final id = response.data ?? "";
            editorController.insertHtml('<p><img src="${APIPath.assetId(id)}" data-filename="${file.name}"></p>');
          }
          return false;
        },
      ),
      otherOptions: OtherOptions(
        height: 400,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.red),
          // borderRadius: const BorderRadius.all(Radius.circular(Sizes.xs)),
        ),
      ),
      callbacks: Callbacks(
        onImageLinkInsert: (String? url) {},
        onImageUpload: (FileUpload file) async {},
        onChangeCodeview: (p0) {},
        onImageUploadError: (FileUpload? file, String? base64Str, UploadError error) {},
      ),
    );
  }
}
