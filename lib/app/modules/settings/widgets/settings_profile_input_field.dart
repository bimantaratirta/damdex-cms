import 'package:flutter/widgets.dart';

import '../../../shareds/widgets/app_textfield.dart';

class SettingsProfileInputField extends StatelessWidget {
  const SettingsProfileInputField({
    super.key,
    required this.label,
    required this.focusNode,
    required this.controller,
    required this.isObscure,
  });

  final String label;
  final FocusNode focusNode;
  final TextEditingController controller;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: Text(label),
      isError: false,
      focusNode: focusNode,
      controller: controller,
      isObscure: isObscure,
    );
  }
}
