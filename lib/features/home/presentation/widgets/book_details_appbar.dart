import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookDetailsAppbar extends StatelessWidget {
  const BookDetailsAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: const Icon(FontAwesomeIcons.x, size: 28, color: Colors.white),
              onPressed: () => Navigator.pop(context)),
          IconButton(
              icon: const Icon(FontAwesomeIcons.cartShopping, size: 28, color: Colors.white),
              onPressed: () {}),
        ],
      ),
    );
  }
}