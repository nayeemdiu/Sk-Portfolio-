// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:skportfolio/screen/skill_chart.dart';
//
// class ResumeScreen extends StatefulWidget {
//   const ResumeScreen({Key? key}) : super(key: key);
//
//   @override
//   _ResumeScreenState createState() => _ResumeScreenState();
// }
//
// class _ResumeScreenState extends State<ResumeScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _offsetAnimation;
//   List<bool> _hoveredStates = List.generate(4, (_) => false);
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     )..forward();
//
//     _offsetAnimation = Tween<Offset>(
//       begin: const Offset(0.5, 0.0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _updateHoverState(int index, bool isHovered) {
//     setState(() {
//       _hoveredStates[index] = isHovered;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 15.0),
//                 child: Text(
//                   "Resume",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontFamily: 'Arial',
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Divider(color: Color.fromRGBO(224, 224, 224, 1.0), height: 0.5),
//               SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: IntrinsicHeight(
//                         child: SlideTransition(
//                           position: _offsetAnimation,
//                           child: buildExperienceEducationContainer(
//                             context,
//                             "EXPERIENCE",
//                             Icons.flag,
//                             [
//                               buildExperienceItem(
//                                 context,
//                                 index: 0,
//                                 title: "Flutter Developer (iHelpBD)",
//                                 date: "2024.....Present",
//                                 description:
//                                 "Developing projects like CRM, iSocial, and task management apps.",
//                                 imagePath: "assets/logo.png",
//                               ),
//                               SizedBox(height: 15),
//                               buildExperienceItem(
//                                 context,
//                                 index: 1,
//                                 title: "Junior App Developer",
//                                 date: "2022.....2023",
//                                 description: "Worked as Android app developer.",
//                                 imagePath: "assets/nexttech.png",
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: IntrinsicHeight(
//                         child: SlideTransition(
//                           position: _offsetAnimation,
//                           child: buildExperienceEducationContainer(
//                             context,
//                             "EDUCATION",
//                             Icons.school,
//                             [
//                               buildExperienceItem(
//                                 context,
//                                 index: 2,
//                                 title: "Bachelor of Science (BSc)",
//                                 date: "2018.....2022",
//                                 description:
//                                 "B.Sc in Computer Science & Engineering at Dhaka International University (DIU)",
//                                 imagePath: "assets/diu.png",
//                               ),
//                               SizedBox(height: 15),
//                               buildExperienceItem(
//                                 context,
//                                 index: 3,
//                                 title: "Science",
//                                 date: "2016.....2017",
//                                 description: "Higher Secondary School (HSC)",
//                                 imagePath: "assets/collage.png",
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10),
//               SkillsoftChat(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildExperienceEducationContainer(
//       BuildContext context,
//       String title,
//       IconData icon,
//       List<Widget> children,
//       ) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             blurRadius: 8,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(icon, color: Colors.teal),
//               SizedBox(width: 6),
//               Text(
//                 title,
//                 style: TextStyle(
//                     color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           SizedBox(height: 15),
//           Divider(color: Color.fromRGBO(224, 224, 224, 1.0), height: 0.5),
//           ...children,
//         ],
//       ),
//     );
//   }
//   Widget buildExperienceItem(
//       BuildContext context, {
//         required int index,
//         required String date,
//         required String title,
//         required String description,
//         required String imagePath,
//       }) {
//     return MouseRegion(
//       onEnter: (_) => _updateHoverState(index, true),
//       onExit: (_) => _updateHoverState(index, false),
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 200),
//         padding: EdgeInsets.all(16),
//         width: 300, // Fixed width for all items
//         height: 200, // Fixed height for all items
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: _hoveredStates[index] ? Colors.grey[100] : Colors.white,
//           boxShadow: _hoveredStates[index]
//               ? [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 8, spreadRadius: 2)]
//               : [],
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     date,
//                     style: TextStyle(color: Colors.teal, fontSize: 14, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     title,
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(height: 8),
//                   Expanded(
//                     child: Text(
//                       description,
//                       style: TextStyle(fontSize: 14),
//                       overflow: TextOverflow.fade,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(width: 20,),
//             Container(
//               width: 50,
//               height: 50,
//               child: Image.asset(
//                 imagePath,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skportfolio/screen/skill_chart.dart';

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({Key? key}) : super(key: key);

  @override
  _ResumeScreenState createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  List<bool> _hoveredStates = List.generate(4, (_) => false);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateHoverState(int index, bool isHovered) {
    setState(() {
      _hoveredStates[index] = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "Resume",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Arial',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Divider(color: Color.fromRGBO(224, 224, 224, 1.0), height: 0.5),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: IntrinsicHeight(
                        child: SlideTransition(
                          position: _offsetAnimation,
                          child: buildExperienceEducationContainer(
                            context,
                            "EXPERIENCE",
                            Icons.flag,
                            ListWheelScrollView(
                              itemExtent: 220, // Height of each item
                              diameterRatio: 2, // Controls the perspective
                              physics: FixedExtentScrollPhysics(),
                              children: [
                                buildExperienceItem(
                                  context,
                                  index: 0,
                                  title: "Flutter Developer (iHelpBD)",
                                  date: "2024.....Present",
                                  description:
                                  "Developing projects like CRM, iSocial, and task management apps.",
                                  imagePath: "assets/logo.png",
                                ),
                                buildExperienceItem(
                                  context,
                                  index: 1,
                                  title: "Junior App Developer",
                                  date: "2022.....2023",
                                  description: "Worked as Android app developer.",
                                  imagePath: "assets/nexttech.png",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: IntrinsicHeight(
                        child: SlideTransition(
                          position: _offsetAnimation,
                          child: buildExperienceEducationContainer(
                            context,
                            "EDUCATION",
                            Icons.school,
                            ListWheelScrollView(
                              itemExtent: 220,
                              diameterRatio: 2,
                              physics: FixedExtentScrollPhysics(),
                              children: [
                                buildExperienceItem(
                                  context,
                                  index: 2,
                                  title: "Bachelor of Science (BSc)",
                                  date: "2018.....2022",
                                  description:
                                  "B.Sc in Computer Science & Engineering at Dhaka International University (DIU)",
                                  imagePath: "assets/diu.png",
                                ),
                                buildExperienceItem(
                                  context,
                                  index: 3,
                                  title: "Science",
                                  date: "2016.....2017",
                                  description: "Higher Secondary School (HSC)",
                                  imagePath: "assets/collage.png",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SkillsoftChat(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildExperienceEducationContainer(
      BuildContext context,
      String title,
      IconData icon,
      Widget scrollView,
      ) {
    return Container(
      height: 410,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(225, 243, 250, 0.4470588235294118),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.teal),
              SizedBox(width: 6),
              Text(
                title,
                style: TextStyle(
                    color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 15),
          Divider(color: Color.fromRGBO(224, 224, 224, 1.0), height: 0.5),
          Expanded(
            child: scrollView, // Wrap the children in ListWheelScrollView
          ),
        ],
      ),
    );
  }

  Widget buildExperienceItem(
      BuildContext context, {
        required int index,
        required String date,
        required String title,
        required String description,
        required String imagePath,
      }) {
    return MouseRegion(
      onEnter: (_) => _updateHoverState(index, true),
      onExit: (_) => _updateHoverState(index, false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.all(16),
        width: 300, // Fixed width for all items
        height: 200, // Fixed height for all items
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: _hoveredStates[index] ? Colors.grey[100] : Colors.white,
          boxShadow: _hoveredStates[index]
              ? [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 8, spreadRadius: 2)]
              : [],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: TextStyle(color: Colors.teal, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: Text(
                      description,
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20,),
            Container(
              width: 50,
              height: 50,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
