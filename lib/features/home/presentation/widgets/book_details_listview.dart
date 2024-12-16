import 'package:books_app/features/home/manager/cubits/related_books_cubit/related_books_cubit.dart';
import 'package:books_app/features/home/manager/models/book_model.dart';
import 'package:books_app/features/home/presentation/widgets/home_carousel_slider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsListView extends StatefulWidget {
  const BookDetailsListView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<BookDetailsListView> createState() => _BookDetailsListViewState();
}

class _BookDetailsListViewState extends State<BookDetailsListView> {
  @override
  void initState() {
    BlocProvider.of<RelatedBooksCubit>(context)
        .fetchRelatedBooks(category: widget.bookModel.category?[0] ?? widget.bookModel.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: BlocBuilder<RelatedBooksCubit, RelatedBooksState>(
        builder: (context, state) {
          if (state is RelatedBooksSuccess) {
            return ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return HomeCarouselSliderItem(bookModel: state.books[index]);
                });
          } else if (state is RelatedBooksFailure) {
            return Center(child: Text(state.errMessage));
          } else {
            return const Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 4));
          }
        },
      ),
    );
  }
}
