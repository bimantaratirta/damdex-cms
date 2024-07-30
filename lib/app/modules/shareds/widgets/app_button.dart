import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';
import '../../../theme/app_colors.dart';

enum ButtonType {
  elevated,
  outlined,
  text,
}

enum ButtonState {
  enable,
  disable,
  loading,
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.state = ButtonState.enable,
    required this.type,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.fixedSize,
    this.padding,
  });

  final ButtonType type;
  final ButtonState state;
  final Widget child;
  final void Function() onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final EdgeInsets? padding;
  final Size? fixedSize;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return _buildButton(context);
  }

  Widget _buildButton(BuildContext context) {
    switch (type) {
      case ButtonType.elevated:
        return _elevatedButton(context);
      case ButtonType.outlined:
        return _outlinedButton();
      case ButtonType.text:
        return _textButton();
    }
  }

  Widget _elevatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: state == ButtonState.enable ? onPressed : null,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: Size.zero,
        fixedSize: fixedSize ?? const Size(double.infinity, 48),
        foregroundColor: foregroundColor ?? AppColors.white,
        backgroundColor: backgroundColor ?? AppColors.accent,
        disabledForegroundColor: AppColors.white.withOpacity(.5),
        disabledBackgroundColor: (backgroundColor ?? AppColors.accent).withOpacity(.5),
        padding: padding ?? const EdgeInsets.symmetric(vertical: Sizes.sr, horizontal: Sizes.r),
        shape: RoundedRectangleBorder(borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(Sizes.sr))),
      ),
      child: state == ButtonState.loading
          ? SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                color: (foregroundColor ?? AppColors.white).withOpacity(.5),
              ),
            )
          : child,
    );
  }

  Widget _outlinedButton() {
    return OutlinedButton(
      onPressed: state == ButtonState.enable ? onPressed : null,
      style: OutlinedButton.styleFrom(
        elevation: 0,
        fixedSize: fixedSize ?? const Size(double.infinity, 48),
        foregroundColor: foregroundColor ?? AppColors.accent,
        backgroundColor: backgroundColor ?? Colors.transparent,
        disabledForegroundColor: foregroundColor ?? AppColors.accent.withOpacity(.5),
        padding: padding ?? const EdgeInsets.symmetric(vertical: Sizes.sr, horizontal: Sizes.r),
        side: BorderSide(
          color: (borderColor ?? AppColors.accent).withOpacity(state == ButtonState.enable ? 1 : .5),
          width: borderWidth ?? 1.0,
        ),
        shape: RoundedRectangleBorder(borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(Sizes.sr))),
      ),
      child: state == ButtonState.loading
          ? SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                color: (foregroundColor ?? AppColors.accent).withOpacity(.5),
              ),
            )
          : child,
    );
  }

  Widget _textButton() {
    return TextButton(
      onPressed: state == ButtonState.enable ? onPressed : null,
      style: TextButton.styleFrom(
        elevation: 0,
        fixedSize: fixedSize ?? const Size(double.infinity, 48),
        foregroundColor: foregroundColor ?? AppColors.accent,
        backgroundColor: backgroundColor ?? Colors.transparent,
        disabledForegroundColor: foregroundColor ?? AppColors.accent.withOpacity(.5),
        padding: padding ?? const EdgeInsets.symmetric(vertical: Sizes.sr, horizontal: Sizes.r),
        shape: RoundedRectangleBorder(borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(Sizes.sr))),
      ),
      child: state == ButtonState.loading
          ? SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                color: (foregroundColor ?? AppColors.accent).withOpacity(.5),
              ),
            )
          : child,
    );
  }
}
