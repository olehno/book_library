import 'package:book_library/bl_book_card_item.dart';
import 'package:book_library/books_response.dart';
import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:flutter/material.dart';

class BookDetailPage extends StatefulWidget {
  const BookDetailPage({super.key, required this.book});

  final BookResponse book;

  @override
  State<BookDetailPage> createState() => _BookDetailPage();
}

class _BookDetailPage extends State<BookDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.light,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: AppColors.primaryOnLight,
          ),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    widget.book.volumeInfo?.imageLinks?.smallThumbnail ?? "",
                    height: 184,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  widget.book.volumeInfo?.title ?? "",
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
                const SizedBox(height: 12),
                Text(
                  widget.book.volumeInfo?.authors?.join(', ') ?? "",
                  style: AppTypography.body2Regular
                      .copyWith(color: AppColors.primary),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    BLBookCardItem(
                        topText: "Released", bottomText: widget.book.volumeInfo?.publishedDate?.substring(0,4) ?? ""),
                    const Spacer(),
                    BLBookCardItem(
                        topText: "Pages", bottomText: widget.book.volumeInfo?.pageCount.toString() ?? ""),
                    const Spacer(),
                    BLBookCardItem(
                        topText: "Rating", bottomText: widget.book.volumeInfo?.averageRating.toString() ?? ""),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  "Description",
                  style: AppTypography.headline2Bold
                      .copyWith(color: AppColors.primaryOnLight),
                ),
                const SizedBox(height: 16),

                Text(
                  widget.book.volumeInfo?.description ?? "",
                  style: AppTypography.body2Regular
                      .copyWith(color: AppColors.primaryOnLight),
                ),
              ],
            ),
          ),
        ));
  }
}
