import 'package:flutter/material.dart';
import 'package:book_bounty/models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback press;

  const BookCard({
    super.key,
    required this.book,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                book.coverImage,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              book.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              book.location,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
