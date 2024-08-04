import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../theme/app_colors.dart';
import 'app_button.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.onTap,
    this.color,
    required this.icon,
    this.state,
  });

  final Function() onTap;
  final Color? color;
  final IconData icon;
  final ButtonState? state;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: state == ButtonState.enable ? onTap : null,
      child: Container(
        padding: const EdgeInsets.all(Sizes.s),
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: const BorderRadius.all(
            Radius.circular(Sizes.xs),
          ),
        ),
        child: state == ButtonState.enable
            ? Icon(
                icon,
                size: Sizes.r,
                color: AppColors.white,
              )
            : const SizedBox(
                width: Sizes.r,
                height: Sizes.r,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.white,
                ),
              ),
      ),
    );
  }
}
