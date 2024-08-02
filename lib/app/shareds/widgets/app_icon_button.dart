import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../theme/app_colors.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.onTap,
    this.color,
    required this.icon,
  });

  final Function() onTap;
  final Color? color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Sizes.s),
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: const BorderRadius.all(
            Radius.circular(Sizes.xs),
          ),
        ),
        child: Icon(
          icon,
          size: Sizes.r,
          color: AppColors.white,
        ),
      ),
    );
  }
}
