import 'package:books_app/features/search/manager/presentation/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 12, top: 6, bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/Logo.png", width: 140),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return  const SearchPage();
                }));
              },
              icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 28, color: Colors.white))
        ],
      ),
    );
  }
}
