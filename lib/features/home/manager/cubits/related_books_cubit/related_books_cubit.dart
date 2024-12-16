import 'package:bloc/bloc.dart';
import 'package:books_app/features/home/manager/models/book_model.dart';
import 'package:books_app/features/home/manager/services/home_repositry.dart';
import 'package:meta/meta.dart';

part 'related_books_state.dart';

class RelatedBooksCubit extends Cubit<RelatedBooksState> {
  RelatedBooksCubit() : super(RelatedBooksInitial());

  Future<void> fetchRelatedBooks({required String category}) async {
    try {
      emit(RelatedBooksLoading());
      var result = await HomeRepositry().getRelatedBooks(category: category);
      emit(RelatedBooksSuccess(books: result));
    } on Exception catch (e) {
      emit(RelatedBooksFailure(errMessage: e.toString()));
    }
  }
}
