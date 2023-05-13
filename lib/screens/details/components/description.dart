import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String bookDesc;

  const Description({
    super.key,
    required this.bookDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 5,
      ),
      child: Text(
        bookDesc,
        style: const TextStyle(fontSize: 14,color: Colors.white70),
      ),
    );
  }
}
