import 'package:book_library/books_repository.dart';
import 'package:book_library/books_response.dart';

class InMemoryBooksRepository implements BooksRepository {
  @override
  Future<List<BookResponse>> getBooks() {
    // TODO: implement getBooks
    throw UnimplementedError();
  }
  // @override
  // Future<List<BookInfo>> getBooks() async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   return _libraryBooks;
  // }

  // @override
  // Future<List<BookInfo>> search(String query) async {
  //   return _libraryBooks
  //       .where((element) => element.bookName.contains(query))
  //       .toList();
  // }

  // final List<BookInfo> _libraryBooks = const [
  //   BookInfo(
  //     id: '1',
  //     author: 'Mark',
  //     bookName: 'Skyrim',
  //     imageUrl:
  //         'https://marketplace.canva.com/EAFKA0RgDtw/1/0/1003w/canva-brown-and-orange-elegant-simple-young-adult-fantasy-book-cover-Qb8uSVdJDzw.jpg',
  //     rating: '4',
  //   ),
  //   BookInfo(
  //     id: '2',
  //     author: 'Anita',
  //     bookName: 'Design',
  //     imageUrl: 'https://m.media-amazon.com/images/I/41gr3r3FSWL.jpg',
  //     rating: '4',
  //   ),
  //   BookInfo(
  //     id: '3',
  //     author: 'James',
  //     bookName: 'Last hope',
  //     imageUrl:
  //         'https://imgv3.fotor.com/images/gallery/Fiction-Book-Covers.jpg',
  //     rating: '4',
  //   ),
  //   BookInfo(
  //     id: '4',
  //     author: 'Kevin',
  //     bookName: 'Leader',
  //     imageUrl:
  //         'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/yellow-business-leadership-book-cover-design-template-dce2f5568638ad4643ccb9e725e5d6ff.jpg?ts=1637017516',
  //     rating: '4',
  //   ),
  // ];
}
