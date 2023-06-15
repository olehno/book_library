import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:flutter/material.dart';

class BLBookDetail extends StatelessWidget {
  const BLBookDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.light,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Book Details",
            style: AppTypography.headline1Bold.copyWith(
              color: AppColors.primaryOnLight,
            ),
          ),
          elevation: 0,
          backgroundColor: AppColors.light,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/7/7a/The_Great_Gatsby_Cover_1925_Retouched.jpg",
                  width: 328,
                  height: 184,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                "The City of Mist",
                style: AppTypography.headline2Bold.copyWith(
                  color: AppColors.primaryOnLight,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Stories",
                style: AppTypography.subtitle1Bold.copyWith(
                  color: AppColors.primaryOnLight,
                ),
              ),
            ],
          ),
        ));
  }
}
