import 'package:book_library/book_list_page.dart';
import 'package:book_library/books_repository.dart';
import 'package:book_library/in_memory_books_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final booksRepository = InMemoryBooksRepository();
  final booksRepositoryProvided = RepositoryProvider<BooksRepository>(
    create: (context) => booksRepository,
  );
  runApp(
    MultiRepositoryProvider(
      providers: [
        booksRepositoryProvided,
      ],
      child: const MaterialApp(
        home: BookListPage(),
      ),
    ),
  );
}
