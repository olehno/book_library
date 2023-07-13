import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:flutter/material.dart';

class BLBookCardItem extends StatelessWidget {
  const BLBookCardItem({super.key, required this.topText, required this.bottomText});

 final String topText;
 final String bottomText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 101,
      height: 54,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.primary,
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(8))),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Text(
                topText,
                style: AppTypography.subtitle2Regular.copyWith(color: AppColors.primaryOnLight),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Text(
                bottomText,
                style: AppTypography.body1SemiBold.copyWith(color: AppColors.primary),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
