import 'package:bloc/bloc.dart';
import 'package:books_app/features/home/manager/models/book_model.dart';
import 'package:books_app/features/search/manager/services/search_repositry.dart';
import 'package:meta/meta.dart';

part 'searched_books_state.dart';

class SearchedBooksCubit extends Cubit<SearchedBooksState> {
  SearchedBooksCubit() : super(SearchedBooksInitial());

  Future<void> fetchNewestBooks({required String category}) async {
    try {
      emit(SearchedBooksLoading());
      var result = await SearchRepositry().getSearchedBooks( category:  category);
      emit(SearchedBooksSuccess(books: result));
    } on Exception catch (e) {
      emit(SearchedBooksFailure(errMessage: e.toString()));
    }
  }
}
