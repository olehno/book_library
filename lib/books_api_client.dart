import 'package:book_library/books_response.dart';
import 'package:dio/dio.dart';

class BooksApiClient {

  final Dio _dio;

  BooksApiClient(this._dio);

  Future<List<BookResponse>> getBooks({String query = 'potter'}) async {
    final response = await _dio.get('volumes?q=$query&maxResults=40');
    final items = (response.data['items']) as List<dynamic>;
    print("Api: $items");
    final mapped = items
        .map<BookResponse>((item) => BookResponse.fromJson(item))
        .toList();
    print("Api 2: $mapped");
    return mapped;
  }


}
