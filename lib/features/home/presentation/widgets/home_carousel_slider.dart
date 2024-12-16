import 'package:books_app/features/home/manager/cubits/featured_cubit/featured_books_cubit.dart';
import 'package:books_app/features/home/presentation/widgets/home_carousel_slider_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCarouselSlider extends StatelessWidget {
  const FeaturedBooksCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: CarouselSlider.builder(
              
              itemCount: state.books.length,
              options: CarouselOptions(
                
                height: MediaQuery.of(context).size.height / 4.5,
                viewportFraction: 0.30,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              ),
              
              itemBuilder: (context, index, realIndex) {
                return HomeCarouselSliderItem(bookModel: state.books[index]);
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return Container(padding: const EdgeInsets.only(bottom: 6),
              height: MediaQuery.of(context).size.height / 4.5, child: Center(child: Text(state.errMessage)));
        } else {
          return Container(padding: const EdgeInsets.only(bottom: 6),
              height: MediaQuery.of(context).size.height / 4.5,
              child: const Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 4)));
        }
      },
    );
  }
}
