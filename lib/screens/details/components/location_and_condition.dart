import 'package:flutter/material.dart';

class LocationAndCondition extends StatelessWidget {
  final String location;
  final String condition;
  const LocationAndCondition({
    super.key,
    required this.location,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                location,
                style: TextStyle(
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Condition",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                condition,
                style: TextStyle(
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
