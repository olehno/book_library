import 'package:book_library/bl_book_list_item.dart';
import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:flutter/material.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Start book search...",
                  hintStyle: AppTypography.subtitle2Regular.copyWith(
                    color: AppColors.primaryOnLight,
                  ),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: AppColors.onPrimaryLight,

                    )
                  ),
                ),
              ),
              SizedBox(height: 32),
              Text(
                "Book search",
                style: AppTypography.headline1Bold.copyWith(
                  color: AppColors.primaryOnLight,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => BLBookListItem(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
