import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skportfolio/screen/projectScreen.dart';
import 'package:skportfolio/screen/resume_screen.dart';
import 'package:skportfolio/widget/menu.dart';
import 'package:skportfolio/widget/profile_screen.dart';
import 'package:skportfolio/widget/my_services.dart';
import 'about_me.dart';
import 'bottom_navigation_screen.dart';
import 'contact_screen.dart';

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
    MyServices(),
    ResumeScreen(),
    ProjectScreen(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Check if it's mobile, tablet, or web view
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    bool isWeb = screenWidth >= 1024;

    return Scaffold(
      backgroundColor: Colors.white,
      // Mobile view with Drawer for Menu
      // drawer: isMobile
      //     ? Drawer(child: MenuScreen(onItemSelected: updateScreen))
      //     : null,
      appBar: isMobile
          ? AppBar(
        elevation: 0,
              title: Text("Sk Portfolio"),
              centerTitle: true,
              backgroundColor: Colors.teal,
            )
          : null,
      body: isMobile
          ? Column(
              children: [
                Expanded(child: BottomNavigationPage()),
              ],
            )
          : Row(
              children: [
                // Menu Sidebar for Tablet and Web
                if (isTablet || isWeb)
                  Expanded(
                    flex: isWeb ? 1 : 2, // Smaller menu for web, larger for tablet
                    child: MenuScreen(onItemSelected: updateScreen),
                  ),
                // Profile Section
                Expanded(
                  flex: isWeb ? 4 : 5, // Larger profile on web
                  child: Column(
                    children: [
                      ProfileScreen(),
                    ],
                  ),
                ),
                // Main Content Section
                Expanded(
                  flex: isWeb ? 7 : 10, // Larger content section on web
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
