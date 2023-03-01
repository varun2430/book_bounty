import 'package:flutter/material.dart';
import 'package:book_bounty/screens/home/components/body.dart';
import 'package:book_bounty/screens/home/components/search_and_menu_button.dart';
import 'package:book_bounty/screens/donate/donate_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DonateScreen(),
            )),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey[500],
        ),
        child: Text("DONATE"),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: SearchAndMenuButton(),
    );
  }
}
