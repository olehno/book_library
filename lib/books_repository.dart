import 'package:book_library/books_response.dart';

abstract class BooksRepository {
  Future<List<BookResponse>> getBooks();

  // Future<List<BookInfo>> search(String query);
}
