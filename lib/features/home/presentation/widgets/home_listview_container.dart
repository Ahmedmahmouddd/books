import 'package:books_app/features/home/manager/models/book_model.dart';
import 'package:books_app/features/home/presentation/screens/book_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeListViewContainer extends StatelessWidget {
  const HomeListViewContainer({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
        return BookDetailsScreen(bookModel: bookModel);
      })),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                    imageUrl: bookModel.imageUrl,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width / 4.5,
                    placeholder: (context, url) => Center(
                        child: SizedBox(
                          height: 122,
                            width: MediaQuery.of(context).size.width / 4.5,
                            child: const Center(
                                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 4)))),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error, color: Colors.white, size: 28))),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                    bookModel.title,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "gt"),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
                const SizedBox(height: 6),
                SizedBox(
                  height: 16,
                  width: 250,
                  child: ListView.separated(
                      separatorBuilder: (context, index) => Text(", ",
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: "p")),
                      scrollDirection: Axis.horizontal,
                      itemCount: bookModel.authors!.length,
                      itemBuilder: (builder, index) {
                        return Text(
                          bookModel.authors![index],
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: "p"),
                        );
                      }),
                ),
                const SizedBox(height: 6),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$${bookModel.price}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: "p")),
                      Row(
                        children: [
                          const Icon(Icons.star_rounded, color: Color.fromARGB(255, 255, 217, 0), size: 20),
                          const SizedBox(width: 1),
                          Text(bookModel.rating,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "p")),
                          Text("(${bookModel.ratingNumber})",
                              style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "p")),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
