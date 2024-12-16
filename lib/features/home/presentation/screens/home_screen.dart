import 'package:books_app/features/home/manager/cubits/featured_cubit/featured_books_cubit.dart';
import 'package:books_app/features/home/manager/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:books_app/features/home/presentation/widgets/head_liner.dart';
import 'package:books_app/features/home/presentation/widgets/home_appbar.dart';
import 'package:books_app/features/home/presentation/widgets/home_carousel_slider.dart';
import 'package:books_app/features/home/presentation/widgets/home_sliver_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeAppbar(),
                  BlocProvider(
                    create: (context) => FeaturedBooksCubit()..fetchFeaturedBooks(),
                    child: const FeaturedBooksCarouselSlider(),
                  ),
                  const HeadLiner(headLine: "Newest"),
                ],
              ),
            ),
            BlocProvider(
              create: (context) => NewestBooksCubit()..fetchNewestBooks(),
              child: const NewestBooksSliverList(),
            )
          ],
        ),
      ),
    );
  }
}
