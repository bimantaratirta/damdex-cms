import 'package:flutter/widgets.dart';

import '../../../constants/sizes.dart';

class Gaps {
  static VGap vertical = VGap();
  static HGap horizontal = HGap();
}

class VGap {
  /// Extra Small: 4.0
  final SizedBox xs = const SizedBox(height: Sizes.xs);

  /// Small: 8.0
  final SizedBox s = const SizedBox(height: Sizes.s);

  /// Semi Regular: 12.0
  final SizedBox sr = const SizedBox(height: Sizes.sr);

  /// Regular: 16.0
  final SizedBox r = const SizedBox(height: Sizes.r);

  /// Semi Medium: 20.0
  final SizedBox sm = const SizedBox(height: Sizes.sm);

  /// Medium: 24.0
  final SizedBox m = const SizedBox(height: Sizes.m);

  /// Semi Large: 28.0
  final SizedBox sl = const SizedBox(height: Sizes.sl);

  /// Large: 32.0
  final SizedBox l = const SizedBox(height: Sizes.l);

  /// Semi Huge: 36.0
  final SizedBox sh = const SizedBox(height: Sizes.sh);

  /// Huge: 40.0
  final SizedBox h = const SizedBox(height: Sizes.h);

  /// Extra Huge: 48.0
  final SizedBox xh = const SizedBox(height: Sizes.xh);
}

class HGap {
  /// Extra Small: 4.0
  final SizedBox xs = const SizedBox(width: Sizes.xs);

  /// Small: 8.0
  final SizedBox s = const SizedBox(width: Sizes.s);

  /// Semi Regular: 12.0
  final SizedBox sr = const SizedBox(width: Sizes.sr);

  /// Regular: 16.0
  final SizedBox r = const SizedBox(width: Sizes.r);

  /// Semi Medium: 20.0
  final SizedBox sm = const SizedBox(width: Sizes.sm);

  /// Medium: 24.0
  final SizedBox m = const SizedBox(width: Sizes.m);

  /// Semi Large: 28.0
  final SizedBox sl = const SizedBox(width: Sizes.sl);

  /// Large: 32.0
  final SizedBox l = const SizedBox(width: Sizes.l);

  /// Semi Huge: 36.0
  final SizedBox sh = const SizedBox(width: Sizes.sh);

  /// Huge: 40.0
  final SizedBox h = const SizedBox(width: Sizes.h);

  /// Extra Huge: 48.0
  final SizedBox xh = const SizedBox(width: Sizes.xh);
}
