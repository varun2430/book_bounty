import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:book_bounty/main.dart';
import 'package:book_bounty/utils.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  _deleteBook(QueryDocumentSnapshot<Object?> book) async {
    try {
      Reference storageRef = FirebaseStorage.instance.ref().child('images');
      Reference imgRef = storageRef.storage.refFromURL(book.get('image'));
      await imgRef.delete();
      await FirebaseFirestore.instance.collection('book').doc(book.id).delete();
    } catch (error) {
      Utils.showSnackBar("Could not delete required book.");
    }
  }

  _launchEmailClient(String email, String title) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Response to Your Request for $title Book',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Utils.showSnackBar("Could not open email client.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 36,
                  color: Colors.black,
                ),
                const SizedBox(width: 10),
                Text(
                  FirebaseAuth.instance.currentUser!.email ?? "",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    navigatorKey.currentState!
                        .popUntil((route) => route.isFirst);
                  },
                  child: const Text(
                    "Log Out",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Books donated:",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 250,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('book')
                    .where('donated_by',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
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

                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final data = snapshot.data!.docs[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(data.get("title")),
                            ),
                            TextButton(
                              onPressed: () {
                                _deleteBook(data);
                              },
                              child: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            )
                          ],
                        );
                      });
                },
              ),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "People who applied for your books:",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 250,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('book')
                    .where('donated_by',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
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

                  return ListView.builder(
                      itemCount: bookData.length,
                      itemBuilder: (context, index) {
                        final key = bookData.keys.elementAt(index);
                        final data = bookData[key];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text(data['title'])),
                            const SizedBox(width: 10),
                            Expanded(child: Text(data['applied_by'])),
                            TextButton(
                              onPressed: () {
                                _launchEmailClient(
                                    data['applied_by'], data['title']);
                              },
                              child: const Icon(
                                Icons.mail,
                                color: Colors.orange,
                              ),
                            )
                          ],
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
