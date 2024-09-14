import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skportfolio/screen/projectScreen.dart';
import 'package:skportfolio/screen/resume_screen.dart';
import 'package:skportfolio/widget/menu.dart';
import 'package:skportfolio/widget/profile_screen.dart';
import 'package:skportfolio/widget/my_services.dart';
import 'about_me.dart';

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
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Container(
                height: 500,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AboutMeSection(),

                    ],
                  ),
                ),
              ),
            )
      ],
    ),
    //AboutMeSection() ,
    MyServices(),
    ResumeScreen(),
    ProjectScreen(),
    Center(
        child: Text('Contact Me Coming Soon', style: TextStyle(fontSize: 20))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
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
