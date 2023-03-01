import 'package:flutter/material.dart';

class SearchAndMenuButton extends StatelessWidget {
  const SearchAndMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            onChanged: (value) {},
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Search Book",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
