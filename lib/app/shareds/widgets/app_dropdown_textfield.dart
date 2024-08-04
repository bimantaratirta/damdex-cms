import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../theme/app_colors.dart';
import 'app_gaps.dart';

class AppDropdownTextField extends StatelessWidget {
  const AppDropdownTextField({
    super.key,
    required this.label,
    this.selectedValue,
    required this.values,
    required this.onChanged,
  });

  final String label;
  final String? selectedValue;
  final List<String> values;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Gaps.vertical.xs,
        InputDecorator(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: Sizes.sm, vertical: Sizes.r),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(Sizes.s)),
              borderSide: BorderSide(color: AppColors.primary.withOpacity(.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(Sizes.s)),
              borderSide: BorderSide(color: AppColors.primary.withOpacity(.2)),
            ),
            suffixIconConstraints: const BoxConstraints(minWidth: 50),
          ),
          isEmpty: selectedValue != null,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              isDense: true,
              onChanged: onChanged,
              items: values.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
