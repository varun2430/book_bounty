import 'package:flutter/material.dart';
import 'package:book_bounty/screens/home/components/categories.dart';
import 'package:book_bounty/screens/home/components/book_card.dart';
import 'package:book_bounty/screens/details/details_screen.dart';
import 'package:book_bounty/models/book.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Categories(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            itemCount: books.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.80,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemBuilder: (context, index) => BookCard(
              book: books[index],
              press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(book: books[index]),
                  )),
            ),
          ),
        )),
      ],
    );
  }
}
