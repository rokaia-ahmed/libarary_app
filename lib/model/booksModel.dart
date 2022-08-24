import 'dart:convert';

class BooksModel {
  final String id;
  final String title;
  final String subTitle;
  final String author;
  final String publishDate;
  final String language;
  final String image;
  final int page;
  final String type;
  final String webView;
  final String desc;

  BooksModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.author,
    required this.publishDate,
    required this.language,
    required this.image,
    required this.page,
    required this.type,
    required this.webView,
    required this.desc,
  });

  BooksModel copyWith({
    String? id,
    String? title,
    String? subTitle,
    String? author,
    String? publishDate,
    String? language,
    String? image,
    int? page,
    String? type,
    String ? webView,
    String? description,
  }) {
    return BooksModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      author: author ?? this.author,
      publishDate: publishDate ?? this.publishDate,
      language: language ?? this.language,
      image: image ?? this.image,
      page: page ?? this.page,
      type: type ?? this.type,
      webView: webView ?? this.webView,
      desc: description ?? desc,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'author': author,
      'publishDate': publishDate,
      'language': language,
      'image': image,
      'page': page,
      'type': type,
      'webView' :webView,
      'description' :desc,
    };
  }

  factory BooksModel.fromMap(Map<String, dynamic> map) {
    return BooksModel(
      id: map['id'] as String,
      title: map['volumeInfo']['title'] as String,
      subTitle: map['volumeInfo']['subtitle'] ?? ' ',
      author: map['volumeInfo']['authors'] != null
          ? map['volumeInfo']['authors'][0]
          : '',
      publishDate: map['volumeInfo']['publishedDate'] ?? '',
      language: map['volumeInfo']['language'] as String,
      image: map['volumeInfo']['imageLinks']['thumbnail'] as String,
      page: map['volumeInfo']['pageCount'] ?? 0,
      type: map['volumeInfo']['categories'] != null
          ? map['volumeInfo']['categories'][0]
          : '',
      webView: map['volumeInfo']['previewLink'] ?? '',
      desc: map['volumeInfo']['description']  ?? ''
    );
  }

  String toJson() => json.encode(toMap());

  factory BooksModel.fromJson(String source) =>
      BooksModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BooksModel(id: $id, title: $title, subTitle: $subTitle,'
        ' author: $author, publishDate: $publishDate,'
        ' language: $language, image: $image,'
        ' page: $page, type: $type, webView: $webView), description :$desc' ;
  }

  @override
  bool operator ==(covariant BooksModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.subTitle == subTitle &&
        other.author == author &&
        other.publishDate == publishDate &&
        other.language == language &&
        other.image == image &&
        other.page == page &&
        other.webView == webView &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    title.hashCode ^
    subTitle.hashCode ^
    author.hashCode ^
    publishDate.hashCode ^
    language.hashCode ^
    image.hashCode ^
    page.hashCode ^
    webView.hashCode ^
    type.hashCode;
  }
}
