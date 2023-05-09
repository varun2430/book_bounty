import 'package:flutter/material.dart';
import 'package:book_bounty/screens/profile/profile_screen.dart';

class SearchAndMenuButton extends StatelessWidget {
  const SearchAndMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Search Book",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              )),
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.account_circle_outlined,
              size: 34,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
