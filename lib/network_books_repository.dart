import 'package:book_library/books_api_client.dart';
import 'package:book_library/books_repository.dart';
import 'package:book_library/books_response.dart';
class NetworkBooksRepository implements BooksRepository {
  final BooksApiClient _booksApiClient;

  NetworkBooksRepository(this._booksApiClient);

  @override
  Future<List<BookResponse>> getBooks() async {
    final books = await _booksApiClient.getBooks();
    // return books.map((book) => book.toString()).toList();
    return books;
  }

}

