import 'package:flutter/material.dart';
import 'package:book_bounty/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final String id;
  final String donatedBy;
  final String appliedBy;
  final String title;
  final String author;
  final String description;
  final String image;
  final String condition;
  final String location;
  const DetailsScreen(
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
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: buildAppBar(context),
      body: Body(
          id: id,
          donatedBy: donatedBy,
          appliedBy: appliedBy,
          title: title,
          author: author,
          description: description,
          image: image,
          condition: condition,
          location: location),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
