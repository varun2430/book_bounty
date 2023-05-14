import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:book_bounty/screens/home/components/book_card.dart';
import 'package:book_bounty/screens/donate/donate_screen.dart';
import 'package:book_bounty/screens/details/details_screen.dart';
import 'package:book_bounty/screens/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final imgPath = [
    'assets/images/slider_1.jpg',
    'assets/images/slider_2.jpg',
    'assets/images/slider_3.jpg',
  ];
  Map<String, dynamic> _books = {};
  Map<String, dynamic> _results = {};
  final FocusNode _focusNode = FocusNode();
  bool searchFocus = false;

  @override
  initState() {
    super.initState();
    getBooks();
    _focusNode.addListener(() {
      setState(() {
        searchFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> getBooks() async {
    final data = await FirebaseFirestore.instance.collection('book').get();
    Map<String, dynamic> bookData = {};
    for (var doc in data.docs) {
      bookData[doc.id] = doc.data();
    }
    _books = bookData;
    _results = bookData;
  }

  void _filter(String query) {
    Map<String, dynamic> res = {};
    if (query.isEmpty) {
      res = _books;
    } else {
      for (var index = 0; index < _books.length; index++) {
        final key = _books.keys.elementAt(index);
        final data = _books[key];
        String title = data['title'];
        if (title.toLowerCase().contains(query.toLowerCase())) {
          res[key] = data;
        }
      }
    }

    setState(() {
      _results = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xff383838),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  focusNode: _focusNode,
                  onChanged: (value) => _filter(value),
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Search Book",
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  )),
              borderRadius: BorderRadius.circular(50),
              child: const Icon(
                Icons.account_circle_outlined,
                size: 36,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
      body: (!searchFocus)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 0,
                    right: 0,
                    top: 10,
                    bottom: 20,
                  ),
                  child: CarouselSlider.builder(
                      itemCount: imgPath.length,
                      options: CarouselOptions(
                        height: 150,
                        viewportFraction: 0.7,
                        autoPlay: true,
                      ),
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset(
                            imgPath[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      }),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('book')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong!');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return GridView.builder(
                          itemCount: snapshot.data!.docs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.80,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            final data = snapshot.data!.docs[index];

                            return BookCard(
                              book: data,
                              press: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                            id: data.id,
                                            donatedBy: data.get('donated_by'),
                                            appliedBy: data.get('applied_by'),
                                            title: data.get('title'),
                                            author: data.get('author'),
                                            description:
                                                data.get('description'),
                                            image: data.get('image'),
                                            condition: data.get('condition'),
                                            location:
                                                '${data.get('city')}, ${data.get('state')}',
                                          ))),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ListView.builder(
                        itemCount: _results.length,
                        itemBuilder: (context, index) {
                          final key = _results.keys.elementAt(index);
                          final data = _results[key];

                          return ListTile(
                            title: Text(
                              data['title'],
                              style: const TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                            subtitle: Text(
                              data['author'],
                              style: const TextStyle(
                                color: Colors.white38,
                              ),
                            ),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                          id: key,
                                          donatedBy: data['donated_by'],
                                          appliedBy: data['applied_by'],
                                          title: data['title'],
                                          author: data['author'],
                                          description: data['description'],
                                          image: data['image'],
                                          condition: data['condition'],
                                          location:
                                              '${data['city']}, ${data['state']}',
                                        ))),
                          );
                        }),
                  ),
                )
              ],
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: (!searchFocus)
          ? ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DonateScreen(),
                  )),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                backgroundColor: const Color(0xff4d4d4d),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Text("DONATE"),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
