import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'books_response.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class BookResponse extends Equatable {
  final String? id;
  final BookVolumeInfoResponse? volumeInfo;

  const BookResponse({
    required this.id,
    required this.volumeInfo,
  });

  factory BookResponse.fromJson(Map<String, dynamic> json) {
    final book = _$BookResponseFromJson(json);
    print("From Json $book");
    return book;
  }

  @override
  List<Object?> get props => [
        id,
        volumeInfo,
      ];
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class BookVolumeInfoResponse extends Equatable {
  final String? title;
  final List<String>? authors;
  final String? publishedDate;
  final int? pageCount;
  final double? averageRating;
  final String? description;
  final BookImageLinksResponse? imageLinks;

  const BookVolumeInfoResponse({
    required this.title,
    required this.authors,
    required this.publishedDate,
    required this.pageCount,
    required this.averageRating,
    required this.description,
    required this.imageLinks,
  });

  factory BookVolumeInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$BookVolumeInfoResponseFromJson(json);

  @override
  List<Object?> get props => [
        title,
        authors,
        description,
        imageLinks,
        pageCount,
        publishedDate,
        averageRating,
      ];
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class BookImageLinksResponse extends Equatable {
  final String? smallThumbnail;

  const BookImageLinksResponse({
    required this.smallThumbnail,
  });

  factory BookImageLinksResponse.fromJson(Map<String, dynamic> json) =>
      _$BookImageLinksResponseFromJson(json);

  @override
  List<Object?> get props => [smallThumbnail];
}
