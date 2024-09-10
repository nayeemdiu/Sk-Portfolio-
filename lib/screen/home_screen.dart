
import 'package:flutter/material.dart';
import 'package:skportfolio/screen/resume_screen.dart';
import 'package:skportfolio/widget/menu.dart';
import 'package:skportfolio/widget/profile_screen.dart';
import 'package:skportfolio/widget/my_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Index to manage selected content
  int selectedIndex = 0;

  // This function will update the selected screen
  void updateScreen(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // List of widgets for dynamic content
  final List<Widget> screens = [
    Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0,right: 5,left: 5),
              child: Text(
                "About Me",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello! I’m Sk Nayeem Ur Rahman",
                    style: TextStyle(color: Colors.teal, fontSize: 18),
                  ),
                  Text(
                    "I’m a Flutter Developer, UI/UX Designer with 3 years of experience...",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
              width: 300,
              height: 200,
              color: Colors.white,
            ),
          ],
        ),
      ],
    ),
    MyServices(), // Services Screen
    ResumeScreen(), // Resume Screen
    Center(child: Text('Projects Coming Soon', style: TextStyle(fontSize: 20))),
    Center(child: Text('Contact Me Coming Soon', style: TextStyle(fontSize: 20))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Menu Sidebar
          Expanded(
            flex: 1,
            child: Column(
              children: [
                MenuScreen(
                  onItemSelected: updateScreen,
                ),
              ],
            ),
          ),
          // Profile Section
          Expanded(
            flex: 4,
            child: Column(
              children: [
                ProfileScreen(),
              ],
            ),
          ),
          // Main Content Section that changes based on selection
          Expanded(
            flex: 7,
            child: Container(
              height: double.infinity,
              color: Colors.white,
              child: screens[selectedIndex], // Display selected screen
            ),
          ),
        ],
      ),
    );
  }
}
