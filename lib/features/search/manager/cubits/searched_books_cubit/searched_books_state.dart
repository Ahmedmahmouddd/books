part of 'searched_books_cubit.dart';

@immutable
sealed class SearchedBooksState {}

final class SearchedBooksInitial extends SearchedBooksState {}

final class SearchedBooksLoading extends SearchedBooksState {}

final class SearchedBooksSuccess extends SearchedBooksState {
  final List<BookModel> books;

  SearchedBooksSuccess({required this.books});
}

final class SearchedBooksFailure extends SearchedBooksState {
  final String errMessage;

  SearchedBooksFailure({required this.errMessage});
}
