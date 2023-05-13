import 'package:flutter/material.dart';
import 'package:book_bounty/screens/details/components/book_title_with_image.dart';
import 'package:book_bounty/screens/details/components/location_and_condition.dart';
import 'package:book_bounty/screens/details/components/description.dart';
import 'package:book_bounty/screens/details/components/know_more_and_apply.dart';

class Body extends StatelessWidget {
  final String id;
  final String donatedBy;
  final String appliedBy;
  final String title;
  final String author;
  final String description;
  final String image;
  final String condition;
  final String location;
  const Body(
      {super.key,
      required this.id,
      required this.donatedBy,
      required this.appliedBy,
      required this.title,
      required this.author,
      required this.description,
      required this.image,
      required this.condition,
      required this.location});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: size.height * 0.1,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xff252525),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      LocationAndCondition(
                        location: location,
                        condition: condition,
                      ),
                      Description(bookDesc: description),
                      KnowMoreAndApply(
                          id: id,
                          title: title,
                          donatedBy: donatedBy,
                          appliedBy: appliedBy),
                    ],
                  ),
                ),
                BookTitleWithImage(
                  title: title,
                  author: author,
                  coverImage: image,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
