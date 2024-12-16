class BookModel {
  BookModel({
    required this.title,
    required this.subTitle,
    required this.language,
    required this.pageCount,
    required this.authors,
    required this.category,
    required this.description,
    required this.publishedDate,
    required this.imageUrl,
    required this.price,
    required this.currency,
    required this.rating,
    required this.ratingNumber,
    required this.previewLink,
  });

  final String title;
  final String? subTitle;
  final String? language;
  final String? pageCount;
  final List<String>? authors;
  final List<String>? category;
  final String description;
  final String publishedDate;
  final String imageUrl;
  final String price;
  final String currency;
  final String rating;
  final String ratingNumber;
  final String previewLink;

  factory BookModel.fromJson(Map<String, dynamic> json) {
    bool isForSale = json['saleInfo']['saleability'] == 'FOR_SALE';

    return BookModel(
      title: json['volumeInfo']['title'] ?? '',
      subTitle: json['volumeInfo']?.containsKey('subtitle') == true ? json['volumeInfo']['subtitle'] : '',
      language: json['volumeInfo']?.containsKey('language') == true ? json['volumeInfo']['language'] : '',
      pageCount: json['volumeInfo']['pageCount'] != null ? json['volumeInfo']['pageCount'].toString() : '',
      authors: List<String>.from(json['volumeInfo']['authors'] ?? []),
      category: List<String>.from(json['volumeInfo']['categories'] ?? []),
      description: json['volumeInfo']['description'] ?? '',
      publishedDate: getPublishedDate(json['volumeInfo']['publishedDate']),
      imageUrl: json['volumeInfo']['imageLinks'] != null ? json['volumeInfo']['imageLinks']['thumbnail'] : '',
      price: isForSale && json['saleInfo']['listPrice'] != null
          ? json['saleInfo']['listPrice']['amount'].toString()
          : '?',
      currency: isForSale && json['saleInfo']['listPrice'] != null
          ? json['saleInfo']['listPrice']['currencyCode']
          : '',
      rating:
          json['volumeInfo']['averageRating'] != null ? json['volumeInfo']['averageRating'].toString() : '?',
      ratingNumber:
          json['volumeInfo']['ratingsCount'] != null ? json['volumeInfo']['ratingsCount'].toString() : '?',
      previewLink: json['volumeInfo']['previewLink'] ?? json['volumeInfo']['infoLink'],
    );
  }

  static String getPublishedDate(String? date) {
    if (date == null || date.isEmpty) {
      return '';
    }
    return date.length >= 4 ? date.substring(0, 4) : date;
  }
}
