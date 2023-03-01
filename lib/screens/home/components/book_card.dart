import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final VoidCallback press;

  const BookCard({
    super.key,
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
              // height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                "assets/images/book_img_placeholder.jpg",
                height: 180,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              "The Lord of the Rings",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              "Mumbai, Maharashtra",
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
