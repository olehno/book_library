import 'package:book_library/book_list_page.dart';
import 'package:book_library/books_api_client.dart';
import 'package:book_library/books_repository.dart';
import 'package:book_library/network_books_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // final booksRepository = InMemoryBooksRepository();
  // final booksRepositoryProvided = RepositoryProvider<BooksRepository>(
  //   create: (context) => booksRepository,
  // );

  final dio = Dio(
    BaseOptions(
      baseUrl: "https://www.googleapis.com/books/v1/",
    ),
  );
  dio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
    ),
  );
  final booksApiClient = BooksApiClient(dio);
  final networkBooksRepository = NetworkBooksRepository(booksApiClient);
  final booksRepositoryProvider = RepositoryProvider<BooksRepository>(
    create: (context) => networkBooksRepository,
  );

  runApp(
    MultiRepositoryProvider(
      providers: [
        // booksRepositoryProvided,
        booksRepositoryProvider,
      ],
      child: const MaterialApp(
        home: BookListPage(),
      ),
    ),
  );
}
