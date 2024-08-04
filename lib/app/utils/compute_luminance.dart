import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

Color computeLuminance(Color color) {
  final result = color.computeLuminance() > 0.75 ? AppColors.black : AppColors.white;
  return result;
}
