import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:book_bounty/screens/details/components/book_title_with_image.dart';
import 'package:book_bounty/screens/details/components/location_and_condition.dart';
import 'package:book_bounty/screens/details/components/description.dart';
import 'package:book_bounty/screens/details/components/know_more_and_apply.dart';
import 'package:book_bounty/models/book.dart';

class Body extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> book;
  const Body({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            // height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: size.height * 0.1,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      LocationAndCondition(
                          location: book.get('location'), condition: book.get('condition')),
                      Description(book_desc: book.get('description')),
                      KnowMoreAndApply(),
                    ],
                  ),
                ),
                BookTitleWithImage(
                  title: book.get('title'),
                  author: book.get('author'),
                  coverImage: book.get('image'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
