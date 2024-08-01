import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../theme/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.suffix,
    this.enabled,
    this.errorText,
    this.onChanged,
    this.initialValue,
    this.onTapOutside,
    this.keyboardType,
    this.contentPadding,
    this.onFieldSubmitted,
    this.isObscure = false,
    this.autoFocus = false,
    this.onEditingComplete,
    required this.label,
    required this.isError,
    required this.focusNode,
    required this.controller,
  });

  final Widget label;
  final bool isError;
  final bool? enabled;
  final Widget? suffix;
  final bool isObscure;
  final bool autoFocus;
  final String? errorText;
  final FocusNode focusNode;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final EdgeInsetsGeometry? contentPadding;
  final Function()? onEditingComplete;
  final Function(String text)? onChanged;
  final Function(String text)? onFieldSubmitted;
  final Function(PointerDownEvent e)? onTapOutside;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      controller: controller,
      focusNode: focusNode,
      onTapOutside: onTapOutside,
      onChanged: onChanged,
      obscureText: isObscure,
      autofocus: autoFocus,
      decoration: InputDecoration(
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: Sizes.sm, vertical: Sizes.r),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(Sizes.s)),
          borderSide: BorderSide(color: AppColors.primary.withOpacity(.2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(Sizes.s)),
          borderSide: BorderSide(color: AppColors.primary.withOpacity(.2)),
        ),
        label: label,
        errorText: isError ? errorText : null,
        errorStyle: errorText?.isEmpty ?? false ? const TextStyle(height: 0) : null,
        suffixIcon: suffix,
        suffixIconConstraints: const BoxConstraints(minWidth: 50),
      ),
      enabled: enabled,
      keyboardType: keyboardType,
    );
  }
}
