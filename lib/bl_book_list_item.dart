import 'package:book_library/book_info.dart';
import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:flutter/material.dart';

class BLBookListItem extends StatelessWidget {
  const BLBookListItem({super.key, required this.books});

  final BookInfo books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              books.imageUrl,
              height: 84,
              width: 77,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8.5),
              Text(books.author,
                  style: AppTypography.subtitle1Bold.copyWith(
                    color: AppColors.onPrimaryLight,
                  )),
              const SizedBox(height: 4),
              Text(
                books.bookName,
                style: AppTypography.caption2Regular.copyWith(
                  color: AppColors.primaryOnLight,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.primary,
                    size: 16,
                  ),
                  const Icon(
                    Icons.star,
                    color: AppColors.primary,
                    size: 16,
                  ),
                  const Icon(
                    Icons.star,
                    color: AppColors.primary,
                    size: 16,
                  ),
                  const Icon(
                    Icons.star,
                    color: AppColors.primary,
                    size: 16,
                  ),
                  const Icon(
                    Icons.star_border,
                    color: AppColors.primary,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "(49)",
                    style: AppTypography.caprion1SemiBold
                        .copyWith(color: AppColors.primary),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
