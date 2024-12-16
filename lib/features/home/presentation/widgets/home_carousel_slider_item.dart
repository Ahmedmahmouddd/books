import 'package:books_app/features/home/manager/models/book_model.dart';
import 'package:books_app/features/home/presentation/screens/book_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeCarouselSliderItem extends StatelessWidget {
  const HomeCarouselSliderItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
        return BookDetailsScreen(bookModel: bookModel);
      })),
      child: SizedBox(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 110,
                child: CachedNetworkImage(
                    imageUrl: bookModel.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 4)),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error, color: Colors.white, size: 28)),
              ))),
    );
  }
}
