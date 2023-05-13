import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:book_bounty/screens/home/components/categories.dart';
import 'package:book_bounty/screens/home/components/book_card.dart';
import 'package:book_bounty/screens/details/details_screen.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Map<String, dynamic> _books = {};
  Map<String, dynamic> _results = {};

  @override
  initState() async {
    final data = await FirebaseFirestore.instance.collection('book').get();
    Map<String, dynamic> bookData = {};
    for (var doc in data.docs) {
      if (doc.get('applied_by').isNotEmpty) {
        bookData[doc.id] = doc.data();
      }
    }

    _books = bookData;
    _results = bookData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('book').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong!');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                Map<String, dynamic> bookData = {};
                for (var doc in snapshot.data!.docs) {
                  if (doc.get('applied_by').isNotEmpty) {
                    bookData[doc.id] = doc.data();
                  }
                }

                setState(() {
                  _books = bookData;
                });

                return GridView.builder(
                  itemCount: _books.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.80,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final key = _books.keys.elementAt(index);
                    final data = _books[key];

                    return BookCard(
                      book: data,
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(book: data))),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
