import 'package:flutter/material.dart';
import 'package:book_bounty/screens/details/components/book_title_with_image.dart';
import 'package:book_bounty/screens/details/components/location_and_condition.dart';
import 'package:book_bounty/screens/details/components/description.dart';
import 'package:book_bounty/screens/details/components/know_more_and_apply.dart';

class Body extends StatelessWidget {
  const Body({super.key});
  final book_desc =
      "The Lord of the Rings is an epic high-fantasy novel by English author and scholar J. R. R. Tolkien. Set in Middle-earth, the story began as a sequel to Tolkien's 1937 children's book The Hobbit, but eventually developed into a much larger work. Written in stages between 1937 and 1949, The Lord of the Rings is one of the best-selling books ever written, with over 150 million copies sold.\nThe title refers to the story's main antagonist, the Dark Lord Sauron, who, in an earlier age, created the One Ring to rule the other Rings of Power given to Men, Dwarves, and Elves, in his campaign to conquer all of Middle-earth. From homely beginnings in the Shire, a hobbit land reminiscent of the English countryside, the story ranges across Middle-earth, following the quest to destroy the One Ring, seen mainly through the eyes of the hobbits Frodo, Sam, Merry and Pippin.";

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
                      LocationAndCondition(),
                      Description(book_desc: book_desc),
                      KnowMoreAndApply(),
                    ],
                  ),
                ),
                BookTitleWithImage(size: size)
              ],
            ),
          ),
        ],
      ),
    );
  }
}


