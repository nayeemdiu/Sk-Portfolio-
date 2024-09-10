import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({Key? key}) : super(key: key);

  @override
  _ResumeScreenState createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Resume Title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Resume",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Arial',
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(color: Color.fromRGBO(224, 224, 224, 1.0), height: 0.5),
            SizedBox(height: 20),

            // Experience and Education
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Experience
                  Expanded(
                    child: SlideTransition(
                      position: _offsetAnimation, // Slide animation
                      child: buildExperienceEducationContainer(
                        context,
                        "EXPERIENCE",
                        Icons.flag,
                        [
                          buildExperienceItem(
                            context,
                            title: "Flutter Developer (iHelpBD)",
                            date: "2024.....Present",
                            description:
                            "Developing projects like CRM, iSocial, and task management apps.",
                            imagePath: "assets/logo.png",
                          ),
                          SizedBox(height: 15),
                          buildExperienceItem(
                            context,
                            title: "Junior App Developer",
                            date: "2022.....2023",
                            description: "Worked as Android app developer.",
                            imagePath: "assets/nexttech.png",
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Education
                  Expanded(
                    child: SlideTransition(
                      position: _offsetAnimation,
                      child: buildExperienceEducationContainer(
                        context,
                        "EDUCATION",
                        Icons.school,
                        [
                          buildExperienceItem(
                            context,
                            title: "Bachelor of Science (BSc)",
                            date: "2018.....2022",
                            description:
                            "B.Sc in Computer Science & Engineering at Dhaka International University (DIU)",
                            imagePath: "assets/diu.png",
                          ),
                          SizedBox(height: 15),
                          buildExperienceItem(
                            context,
                            title: "Science",
                            date: "2016.....2017",
                            description: "Higher Secondary School (HSC)",
                            imagePath: "assets/collage.png",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildExperienceEducationContainer(
      BuildContext context,
      String title,
      IconData icon,
      List<Widget> children,
      ) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
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
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 15),
          Divider(
            color: Color.fromRGBO(224, 224, 224, 1.0),
            height: 0.5,
          ),
          ...children,
        ],
      ),
    );
  }

  Widget buildExperienceItem(
      BuildContext context, {
        required String date,
        required String title,
        required String description,
        required String imagePath,
      }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 17.0),
                child: Text(
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  date,

                ),
              ),
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                description,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
      ],
    );
  }
}
