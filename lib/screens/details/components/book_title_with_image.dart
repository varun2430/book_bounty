import 'package:flutter/material.dart';
import 'package:book_bounty/models/book.dart';

class BookTitleWithImage extends StatelessWidget {
  final String title;
  final List<String> authors;
  final String coverImage;

  const BookTitleWithImage({
    super.key,
    required this.title,
    required this.authors,
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
            authors[0],
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
                child: Image.asset(
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
