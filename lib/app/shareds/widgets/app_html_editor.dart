import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

import '../../data/api/api_path.dart';
import '../../data/api/asset/data/upload_asset.dart';
import '../../theme/app_colors.dart';
import '../../utils/check_youtube_link.dart';
import '../../utils/convert_url_to_id.dart';
import 'app_textfield.dart';

class AppHtmlEditor extends StatelessWidget {
  const AppHtmlEditor({
    super.key,
    required this.editorController,
    this.initialText,
    required this.hint,
    this.onChanged,
  });

  final String? initialText;
  final String hint;
  final HtmlEditorController editorController;
  final Function(String?)? onChanged;

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
        customToolbarButtons: [
          InkWell(
            onTap: () async {
              Get.dialog(
                barrierDismissible: false,
                HtmlEditorIframeDialog(
                  editorController: editorController,
                ),
              );
            },
            child: const Icon(Icons.video_collection_outlined),
          ),
        ],
        toolbarType: ToolbarType.nativeGrid,
        mediaLinkInsertInterceptor: (String url, InsertFileType type) {
          return true;
        },
        mediaUploadInterceptor: (PlatformFile file, InsertFileType type) async {
          final response = await uploadAsset(bytes: file.bytes?.toList(), fileName: file.name);
          if (response.data != null) {
            final id = response.data ?? "";
            editorController.insertHtml('<p><img src="${APIPath.assetId(id)}" data-filename="${file.name}"></p>');
          } else {
            Get.showSnackbar(
              const GetSnackBar(
                title: "Terjadi kesalahan saat memasukan gambar",
                message: "Ukuran gambar tidak boleh lebih dari 1MB, dan pastikan file tersebut adalah gambar",
                duration: Duration(seconds: 5),
                backgroundColor: Colors.red,
                snackPosition: SnackPosition.TOP,
              ),
            );
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
        onChangeCodeview: onChanged,
        onImageUploadError: (FileUpload? file, String? base64Str, UploadError error) {},
        onFocus: () {
          // FocusScope.of(context).requestFocus(FocusNode());
          // editorController.setFocus();
        },
      ),
    );
  }
}

class HtmlEditorIframeDialog extends StatefulWidget {
  const HtmlEditorIframeDialog({
    super.key,
    required this.editorController,
  });

  final HtmlEditorController editorController;

  @override
  State<HtmlEditorIframeDialog> createState() => _HtmlEditorIframeDialogState();
}

class _HtmlEditorIframeDialogState extends State<HtmlEditorIframeDialog> {
  bool isError = false;
  final FocusNode fn = FocusNode();
  final TextEditingController c = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PointerInterceptor(
      child: AlertDialog(
        title: const Text("Insert YouTube url"),
        content: AppTextField(
          label: const Text("YouTube url"),
          isError: isError,
          errorText: "url is not valid",
          onChanged: (text) {
            isError ? setState(() => isError = false) : null;
          },
          focusNode: fn,
          controller: c,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (!isValidYouTubeLink(c.text)) {
                setState(() => isError = true);
              } else {
                widget.editorController.insertHtml(
                    '<iframe width="560" height="315" src="https://www.youtube.com/embed/${convertUrlToId(c.text)}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>');
                Navigator.of(context).pop();
              }
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
