import 'package:books_app/features/home/manager/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsDoubleButton extends StatelessWidget {
  const BookDetailsDoubleButton({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(18), bottomLeft: Radius.circular(18))),
          width: MediaQuery.of(context).size.width / 3,
          child: TextButton(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
            ),
            onPressed: () {},
            child: Text("\$ ${bookModel.price}",
                style: const TextStyle(
                    color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500, fontFamily: "p")),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius:
                  BorderRadius.only(topRight: Radius.circular(18), bottomRight: Radius.circular(18))),
          width: MediaQuery.of(context).size.width / 3,
          child: TextButton(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
            ),
            onPressed: () async {
              final Uri url = Uri.parse(bookModel.previewLink);
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            child: const Text("Free preview",
                style: TextStyle(
                    color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500, fontFamily: "p")),
          ),
        ),
      ],
    );
  }
}
