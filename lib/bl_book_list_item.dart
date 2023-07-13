import 'package:book_library/books_response.dart';
import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';

class BLBookListItem extends StatefulWidget {
  const BLBookListItem({super.key, required this.book});

  final BookResponse book;

  @override
  State<BLBookListItem> createState() => _BLBookListItemState();
}

class _BLBookListItemState extends State<BLBookListItem> {
  RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

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
              widget.book.volumeInfo?.imageLinks?.smallThumbnail ?? "",
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
              Text(widget.book.volumeInfo?.authors?.join(', ') ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.subtitle1Bold.copyWith(
                    color: AppColors.onPrimaryLight,
                  )),
              const SizedBox(height: 4),
              Text(
                widget.book.volumeInfo?.title ?? "",
                overflow: TextOverflow.ellipsis,

                style: AppTypography.caption2Regular.copyWith(
                  color: AppColors.primaryOnLight,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  FlutterRating(
                    rating: widget.book.volumeInfo?.averageRating ?? 0,
                    starCount: 5,
                    borderColor: AppColors.primary,
                    color: AppColors.primary,
                    allowHalfRating: true,
                    size: 16,
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.book.volumeInfo?.ratingsCount.toString().replaceAll(regex, '') ?? "",
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
