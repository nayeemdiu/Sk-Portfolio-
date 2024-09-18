
import 'package:flutter/material.dart';
import 'package:skportfolio/screen/projectScreen.dart';
import 'package:skportfolio/screen/resume_screen.dart';
import '../widget/my_services.dart';
import '../widget/profile_screen.dart';
import 'contact_screen.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int mycurrentIndex = 0;
  List pages = [
    ProfileScreen(),
    ResumeScreen(),
    ProjectScreen(),
    MyServices(),
    ContactPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar:
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        decoration:BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.5),blurRadius: 25,
                  offset: const Offset(8, 20))
            ]

        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.teal,
              unselectedItemColor: Colors.black,
              currentIndex: mycurrentIndex,
              onTap: (index){
                setState(() {
                  mycurrentIndex = index;
                });
              },
              items: const  [
                BottomNavigationBarItem(icon: Icon(Icons.person),label: "About"),
                BottomNavigationBarItem(icon: Icon(Icons.ac_unit_outlined),label: "Resume"),
                BottomNavigationBarItem(icon: Icon(Icons.work),label: "Project"),
                BottomNavigationBarItem(icon: Icon(Icons.accessible),label: "Skill"),
                BottomNavigationBarItem(icon: Icon(Icons.call),label: "Contact"),

              ]),
        ),
      ),


      body: pages[mycurrentIndex],




    );
  }
}