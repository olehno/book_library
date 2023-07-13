import 'dart:async';

import 'package:book_library/bl_book_list_item.dart';
import 'package:book_library/book_detail_page.dart';
import 'package:book_library/books_repository.dart';
import 'package:book_library/books_response.dart';
import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  late final BooksRepository _booksRepository;
  late final Future<List<BookResponse>>? _booksFuture;

  // final TextEditingController _searchController = TextEditingController();
  // Timer? _debouncer;

  // void _debounceSearch() {
  //   if (_debouncer != null) {
  //     _debouncer?.cancel();
  //   }
  //   _debouncer = Timer(const Duration(seconds: 1), () {
  //     final query = _searchController.text;
  //     setState(() {
  //       booksFuture = booksRepository.search(query);
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _booksRepository = context.read();
    _booksFuture = _booksRepository.getBooks();
    // _searchController.addListener(() {
    //   _debounceSearch();
    // });
  }

  // @override
  // void dispose() {
  //   _searchController.dispose();
  //   _debouncer?.cancel();
  //   super.dispose();
  // }

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
              const SizedBox(height: 24),
              TextFormField(
                // controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Start book search...",
                  hintStyle: AppTypography.subtitle2Regular.copyWith(
                    color: AppColors.primaryOnLight,
                  ),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: AppColors.onPrimaryLight,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                "Book search",
                style: AppTypography.headline1Bold.copyWith(
                  color: AppColors.primaryOnLight,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<List<BookResponse>>(
                  future: _booksFuture,
                  builder: (context, snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final books = snapShot.data ?? [];
                    print("Future: $books");
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemCount: books.length,
                            itemBuilder: (context, index) {
                              final item = books[index];
                              return GestureDetector(
                                  onTap: () {
                                    _onOpenDetailsPage(item);
                                  },
                                  child: BLBookListItem(book: item));
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 16),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.favorite),
      ),
    );
  }

  void _onOpenDetailsPage(BookResponse item) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BookDetailPage(book: item),
      ),
    );
  }
}
