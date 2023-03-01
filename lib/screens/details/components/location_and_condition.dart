import 'package:flutter/material.dart';

class LocationAndCondition extends StatelessWidget {
  const LocationAndCondition({
    super.key,
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
                "Mumbai, Maharashtra",
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
                "Good",
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
