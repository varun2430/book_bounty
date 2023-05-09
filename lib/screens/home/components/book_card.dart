import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookCard extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> book;
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
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF19A7CE),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                book.get("image"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              book.get('title'),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              '${book.get('city')}, ${book.get('state')}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
