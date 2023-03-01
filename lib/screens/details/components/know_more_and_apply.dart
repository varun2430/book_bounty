import 'package:flutter/material.dart';

class KnowMoreAndApply extends StatelessWidget {
  const KnowMoreAndApply({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
              bottom: 10,
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[500],
              ),
              child: Text("KNOW MORE"),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
              bottom: 10,
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[500],
              ),
              child: Text("APPLY NOW"),
            ),
          ),
        )
      ],
    );
  }
}
