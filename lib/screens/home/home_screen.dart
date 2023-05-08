import 'package:flutter/material.dart';
import 'package:book_bounty/screens/home/components/body.dart';
import 'package:book_bounty/screens/home/components/search_and_menu_button.dart';
import 'package:book_bounty/screens/donate/donate_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB4E4FF),
      appBar: buildAppBar(context),
      body: const Body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DonateScreen(),
            )),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
        ),
        child: const Text("DONATE"),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFF146C94),
      title: const SearchAndMenuButton(),
    );
  }
}
