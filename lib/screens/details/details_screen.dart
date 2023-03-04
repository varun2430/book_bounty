import 'package:flutter/material.dart';
import 'package:book_bounty/screens/details/components/body.dart';
import 'package:book_bounty/models/book.dart';

class DetailsScreen extends StatelessWidget {
  final Book book;
  const DetailsScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: buildAppBar(context),
      body: Body(book: book),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
