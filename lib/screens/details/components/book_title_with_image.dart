import 'package:flutter/material.dart';

class BookTitleWithImage extends StatelessWidget {
  const BookTitleWithImage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "The Lord of the Rings",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "J. R. R. Tolkien",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  "assets/images/book_img_placeholder.jpg",
                  height: size.height * 0.28,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
