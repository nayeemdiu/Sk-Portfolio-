// import 'package:flutter/material.dart';
// import 'package:skportfolio/screen/resume_screen.dart';
// import 'package:skportfolio/widget/menu.dart';
// import 'package:skportfolio/widget/profile_screen.dart';
//
// import '../widget/my_services.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           Expanded(
//               flex: 1,
//               child: Column(
//                 children: [MenuScreen()],
//               )),
//           Expanded(
//               flex: 4,
//               child: Column(
//                 children: [
//                   ProfileScreeen(),
//                 ],
//               )),
//           Expanded(
//               flex: 7,
//               child: Container(
//                 height: double.infinity,
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//
//                     ///about
//                     //about
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             "About Me",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: 20),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Hello! I’m Sk Nayeem Ur Rahman",
//                                   style: TextStyle(color: Colors.teal,fontSize: 18),
//                                 ),
//                                 Text( style: TextStyle(color: Colors.black,fontSize: 15),
//                                     "I’m a Flutter Developer , UI/UX Designer with 3 years experience. I’m interested to work with Mobile Application development, UI Design, Web Design related work. But my major focus is on Mobile App Development, build any kinds of App using Flutter."),
//                               ],
//                             ),
//                             width: MediaQuery.sizeOf(context).width * 0.27,
//                             height: MediaQuery.sizeOf(context).height * 0.35,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             child: Column(
//
//                               children: [
//
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         color: const Color.fromRGBO(151, 222, 219, 0.4470588235294118),
//                                         borderRadius: BorderRadius.circular(6),
//                                       ),
//                                       height: 23,
//                                       width: 55,
//                                       child: Center(
//                                         child: Text(
//                                           "Age:",
//                                           style: TextStyle(color: Colors.black,fontSize: 18),
//                                         ),
//                                       ),
//                                     ),
//                                     Text( style: TextStyle(color: Colors.black,fontSize: 15),
//                                         "26"),
//                                   ],
//                                 ),
//                                 SizedBox(height: 7,),
//                                 Divider(color: Color.fromRGBO(
//                                     224, 224, 224, 1.0),height: 0.5,),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         color: const Color.fromRGBO(151, 222, 219, 0.4470588235294118),
//                                         borderRadius: BorderRadius.circular(6),
//                                       ),
//                                       height: 23,
//                                       width: 90,
//                                       child: Center(
//                                         child: Text(
//                                           "Residence:",
//                                           style: TextStyle(color: Colors.black,fontSize: 18),
//                                         ),
//                                       ),
//                                     ),
//                                     Text( style: TextStyle(color: Colors.black,fontSize: 15),
//                                         "Bangladesh"),
//                                   ],
//                                 ),
//                                 SizedBox(height: 7,),
//                                 Divider(color: Color.fromRGBO(
//                                     224, 224, 224, 1.0),height: 0.5,),
//
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         color: const Color.fromRGBO(151, 222, 219, 0.4470588235294118),
//                                         borderRadius: BorderRadius.circular(6),
//                                       ),
//                                       height: 23,
//                                       width:90,
//                                       child: Center(
//                                         child: Text(
//                                           "Freelance:",
//                                           style: TextStyle(color: Colors.black,fontSize: 18),
//                                         ),
//                                       ),
//                                     ),
//                                     Text( style: TextStyle(color: Colors.black,fontSize: 15),
//                                         "Available"),
//                                   ],
//                                 ),
//                                 SizedBox(height: 7,),
//                                 Divider(color: Color.fromRGBO(
//                                     224, 224, 224, 1.0),height: 0.5,),
//
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         color: const Color.fromRGBO(151, 222, 219, 0.4470588235294118),
//                                         borderRadius: BorderRadius.circular(6),
//                                       ),
//                                       height: 23,
//                                       width: 85,
//                                       child: Center(
//                                         child: Text(
//                                           "Address:",
//                                           style: TextStyle(color: Colors.black,fontSize: 18),
//                                         ),
//                                       ),
//                                     ),
//                                     Text( style: TextStyle(color: Colors.black,fontSize: 15),
//                                         "Dhaka, Bangladesh"),
//                                   ],
//                                 ),
//                                 SizedBox(height: 7,),
//                                 Divider(color: Color.fromRGBO(
//                                     224, 224, 224, 1.0),height: 0.5,),
//
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Container(  decoration: BoxDecoration(
//                                       color: const Color.fromRGBO(151, 222, 219, 0.4470588235294118),
//                                       borderRadius: BorderRadius.circular(6),
//                                     ),
//
//                                       height: 23,
//                                       width: 55,
//                                       child: Center(
//                                         child: Text(
//                                           "Email:",
//                                           style: TextStyle(color: Colors.black,fontSize: 18),
//                                         ),
//                                       ),
//                                     ),
//                                     Text( style: TextStyle(color: Colors.black,fontSize: 15),
//                                         "nayeemdeveloperbd@gmail.com"),
//                                   ],
//                                 ),
//
//                               ],
//                             ),
//                             width: MediaQuery.sizeOf(context).width * 0.27,
//                             height: MediaQuery.sizeOf(context).height * 0.35,
//                             color: Colors.white,
//                           ),
//                         ),
//
//                       ],
//                     ),
//
//                     ///my service
//
//                    MyServices(),
//                    ResumeScreen(),
//
//                   ],
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }

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
              padding: const EdgeInsets.all(8.0),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                ProfileScreeen(),
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
