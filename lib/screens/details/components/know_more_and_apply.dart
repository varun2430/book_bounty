import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:book_bounty/main.dart';
import 'package:book_bounty/utils.dart';

class KnowMoreAndApply extends StatelessWidget {
  final String id;
  final String donatedBy;
  final String appliedBy;
  final String title;
  const KnowMoreAndApply(
      {super.key,
      required this.id,
      required this.donatedBy,
      required this.appliedBy,
      required this.title});

  Future<void> apply() async {
    try {
      await FirebaseFirestore.instance
          .collection('book')
          .doc(id)
          .update({'applied_by': FirebaseAuth.instance.currentUser!.email});
    } catch (e) {
      Utils.showSnackBar("Could not apply.");
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  void googleSearch(String searchQuery) async {
    final url = 'https://www.google.com/search?q=$searchQuery';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Utils.showSnackBar('Cound not open browser.');
    }
  }

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
              onPressed: () {
                googleSearch(title);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              child: const Text("KNOW MORE"),
            ),
          ),
        ),
        ((donatedBy != FirebaseAuth.instance.currentUser!.uid) &&
                (appliedBy == ""))
            ? Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                    bottom: 10,
                  ),
                  child: ElevatedButton(
                    onPressed: apply,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: const Text("APPLY NOW"),
                  ),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
