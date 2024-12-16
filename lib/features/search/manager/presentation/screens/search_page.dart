import 'package:books_app/features/home/presentation/widgets/home_listview_container.dart';
import 'package:books_app/features/search/manager/cubits/searched_books_cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            SearchPageSearchField(),
            BlocBuilder<SearchedBooksCubit, SearchedBooksState>(
              builder: (context, state) {
                if (state is SearchedBooksInitial) {
                  return Container();
                } else if (state is SearchedBooksSuccess) {
                  return Expanded(
                    child: ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        separatorBuilder: (context, index) => const SizedBox(height: 8),
                        itemCount: state.books.length,
                        itemBuilder: (context, index) {
                          return HomeListViewContainer(bookModel: state.books[index]);
                        }),
                  );
                } else if (state is SearchedBooksFailure) {
                  return Expanded(child: Center(child: Text(state.errMessage)));
                } else {
                  return const Expanded(
                    child: Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 4)),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class SearchPageSearchField extends StatelessWidget {
  SearchPageSearchField({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
      child: TextField(
          controller: searchController,
          onSubmitted: (value) {
            BlocProvider.of<SearchedBooksCubit>(context).fetchNewestBooks(category: value);
          },
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white, fontFamily: 'p', fontSize: 16),
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  if (searchController.text.isNotEmpty) {
                    searchController.clear();
                    
                  } else if (searchController.text.isEmpty) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.close, color: Colors.white)),
            hintText: "Search",
            hintStyle: const TextStyle(color: Colors.white, fontFamily: 'p', fontSize: 16),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Colors.white)),
          )),
    );
  }
}
