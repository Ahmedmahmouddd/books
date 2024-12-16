import 'package:books_app/features/home/manager/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
                width: MediaQuery.of(context).size.width / 2.1,
                imageUrl: bookModel.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 4)),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.white, size: 28))),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            bookModel.title,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "gt"),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 30,
          width: 200,
          child: ListView.separated(
              separatorBuilder: (context, index) => Text(", ",
                  style: TextStyle(
                      color: Colors.grey[400], fontSize: 12, fontWeight: FontWeight.w500, fontFamily: "p")),
              scrollDirection: Axis.horizontal,
              itemCount: bookModel.authors!.length,
              itemBuilder: (builder, index) {
                return Text(
                  bookModel.authors![index],
                  style: TextStyle(
                      color: Colors.grey[400], fontSize: 16, fontWeight: FontWeight.w500, fontFamily: "p"),
                );
              }),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star_rounded, color: Color.fromARGB(255, 255, 217, 0), size: 20),
            const SizedBox(width: 1),
            Text(bookModel.rating,
                style: const TextStyle(
                    color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: "p")),
            Text(" (${bookModel.ratingNumber})",
                style: TextStyle(
                    color: Colors.grey[300], fontSize: 14, fontWeight: FontWeight.w500, fontFamily: "p")),
          ],
        )
      ],
    );
  }
}
