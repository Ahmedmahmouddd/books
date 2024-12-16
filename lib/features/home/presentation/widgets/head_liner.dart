import 'package:flutter/material.dart';

class HeadLiner extends StatelessWidget {
  final String headLine;
  const HeadLiner({
    super.key,
    required this.headLine,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 6,bottom: 6),
      child: Text(headLine,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700, fontFamily: "p")),
    );
  }
}
