import 'package:books_app/features/home/manager/models/book_model.dart';
import 'package:dio/dio.dart';

class HomeRepositry {
  final dio = Dio();

  Future<List<BookModel>> getFeaturedBooks() async {
    var response = await dio
        .get('https://www.googleapis.com/books/v1/volumes?q=subject:fiction&orderBy=newest&maxResults=40');

    Map<String, dynamic> responseData = response.data;

    List<BookModel> books = [];
    if (responseData['totalItems'] != 0) {
      for (var book in responseData['items']) {
        books.add(BookModel.fromJson(book));
      }
    }
    return books;
  }

  Future<List<BookModel>> getNewestBooks() async {
    var response = await dio
        .get('https://www.googleapis.com/books/v1/volumes?q=subject:literature&orderBy=newest&maxResults=40');

    Map<String, dynamic> responseData = response.data;

    List<BookModel> books = [];
    if (responseData['totalItems'] != 0) {
      for (var book in responseData['items']) {
        books.add(BookModel.fromJson(book));
      }
    }
    return books;
  }

  Future<List<BookModel>> getRelatedBooks({required String category}) async {
    var response = await dio.get('https://www.googleapis.com/books/v1/volumes?q=$category&maxResults=40');

    Map<String, dynamic> responseData = response.data;

    List<BookModel> books = [];
    if (responseData['totalItems'] != 0) {
      for (var book in responseData['items']) {
        books.add(BookModel.fromJson(book));
      }
    }
    return books;
  }
}
