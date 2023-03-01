import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.book_desc,
  });

  final String book_desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 5,
      ),
      child: Text(
        book_desc,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
