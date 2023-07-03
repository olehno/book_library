import 'package:book_library/books_response.dart';
import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:flutter/material.dart';

class BLBookListItem extends StatefulWidget {
  const BLBookListItem({super.key, required this.books});

  final BookResponse books;

  @override
  State<BLBookListItem> createState() => _BLBookListItemState();
}

class _BLBookListItemState extends State<BLBookListItem> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child:
            Image.network(
              widget.books.volumeInfo?.imageLinks?.smallThumbnail ?? "",
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
              Text(widget.books.volumeInfo?.authors?.join(', ') ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.subtitle1Bold.copyWith(
                    color: AppColors.onPrimaryLight,
                  )),
              const SizedBox(height: 4),
              Text(
                widget.books.volumeInfo?.title ?? "",
                overflow: TextOverflow.ellipsis,

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
