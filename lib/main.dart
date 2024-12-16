import 'package:books_app/features/home/presentation/screens/home_screen.dart';
import 'package:books_app/features/search/manager/cubits/searched_books_cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchedBooksCubit(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: const Color.fromARGB(255, 5, 55, 96)),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
