import 'package:books_app/features/home/manager/cubits/related_books_cubit/related_books_cubit.dart';
import 'package:books_app/features/home/manager/models/book_model.dart';
import 'package:books_app/features/home/presentation/widgets/book_details.dart';
import 'package:books_app/features/home/presentation/widgets/book_details_appbar.dart';
import 'package:books_app/features/home/presentation/widgets/book_details_double_button.dart';
import 'package:books_app/features/home/presentation/widgets/book_details_listview.dart';
import 'package:books_app/features/home/presentation/widgets/head_liner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => RelatedBooksCubit(),
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const BookDetailsAppbar(),
              BookDetails(bookModel: bookModel),
              const SizedBox(height: 12),
              BookDetailsDoubleButton(bookModel: bookModel),
              const Align(
                  alignment: Alignment.centerLeft, child: HeadLiner(headLine: "You can also like this")),
              BookDetailsListView(bookModel: bookModel),
            ],
          ),
        ),
      ),
    );
  }
}
