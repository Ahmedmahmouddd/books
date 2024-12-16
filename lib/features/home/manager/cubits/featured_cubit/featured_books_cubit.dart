import 'package:bloc/bloc.dart';
import 'package:books_app/features/home/manager/models/book_model.dart';
import 'package:books_app/features/home/manager/services/home_repositry.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit() : super(FeaturedBooksInitial());

  Future<void> fetchFeaturedBooks() async {
    try {
      emit(FeaturedBooksLoading());
      var result = await HomeRepositry().getFeaturedBooks();
      emit(FeaturedBooksSuccess(books: result));
    } on Exception catch (e) {
      emit(FeaturedBooksFailure(errMessage: e.toString()));
    }
  }
}
