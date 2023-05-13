import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:book_bounty/screens/donate/donate_screen.dart';

import '../details/details_screen.dart';
import '../profile/profile_screen.dart';
import 'components/book_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final img_url = [
    'https://wallpapers.net/web/wallpapers/dark-forest-passage-hd-wallpaper/thumbnail/lg.jpg',
    'https://c4.wallpaperflare.com/wallpaper/288/993/204/dark-forest-hd-wallpaper-preview.jpg',
    'https://c4.wallpaperflare.com/wallpaper/127/202/462/green-dark-jungle-wallpaper-thumb.jpg'
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
      backgroundColor: const Color(0xFFB4E4FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF146C94),
        title: Row(
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
                  focusNode: _focusNode,
                  onChanged: (value) => _filter(value),
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
                  color: Color(0xFFB4E4FF),
                ),
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
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: CarouselSlider.builder(
                      itemCount: img_url.length,
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                      ),
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.network(
                            img_url[index],
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
                                      builder: (context) =>
                                          DetailsScreen(book: data))),
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
                  child: ListView.builder(
                      itemCount: _results.length,
                      itemBuilder: (context, index) {
                        final key = _results.keys.elementAt(index);
                        final data = _results[key];
                        
                        return Card(
                          elevation: 1,
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          child: ListTile(
                            title: Text(data['title']),
                            subtitle: Text(data['author']),
                            //   onTap: () => Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) =>
                            //               DetailsScreen(book: data))),
                          ),
                        );
                      }),
                )
              ],
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DonateScreen(),
            )),
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: Colors.lightBlueAccent,
        ),
        child: const Text("DONATE"),
      ),
    );
  }
}
