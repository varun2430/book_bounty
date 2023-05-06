import 'package:flutter/material.dart';

class BookTitleWithImage extends StatelessWidget {
  final String title;
  final String author;
  final String coverImage;

  const BookTitleWithImage({
    super.key,
    required this.title,
    required this.author,
    required this.coverImage,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            author,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Image.network(
                  coverImage,
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
