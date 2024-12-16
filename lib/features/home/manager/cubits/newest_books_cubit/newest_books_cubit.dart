import 'package:bloc/bloc.dart';
import 'package:books_app/features/home/manager/models/book_model.dart';
import 'package:books_app/features/home/manager/services/home_repositry.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit() : super(NewestBooksInitial());

  Future<void> fetchNewestBooks() async {
    try {
      emit(NewestBooksLoading());
      var result = await HomeRepositry().getNewestBooks();
      emit(NewestBooksSuccess(books: result));
    } on Exception catch (e) {
      emit(NewestBooksFailure(errMessage: e.toString()));
    }
  }
}
