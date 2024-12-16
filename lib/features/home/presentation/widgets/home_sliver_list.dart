import 'package:books_app/features/home/manager/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:books_app/features/home/presentation/widgets/home_listview_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksSliverList extends StatelessWidget {
  const NewestBooksSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return HomeListViewContainer(bookModel: state.books[index]);
              });
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.errMessage)));
        } else {
          return const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 4)));
        }
      },
    );
  }
}
