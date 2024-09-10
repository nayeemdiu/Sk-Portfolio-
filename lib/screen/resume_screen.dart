import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({Key? key}) : super(key: key);

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
                    fontSize: 20),
              ),
            ),

            // Divider
            SizedBox(height: 10),
            Divider(color: Color.fromRGBO(224, 224, 224, 1.0), height: 0.5),
            SizedBox(height: 20),

            // Experience and Education
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Experience
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.flag, color: Colors.teal),
                            SizedBox(width: 6),
                            Text(
                              "EXPERIENCE",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Divider(
                          color: Color.fromRGBO(224, 224, 224, 1.0),
                          height: 0.5,
                        ),
                        // Experience details
                        buildExperienceItem(
                          context,
                          date: "2024.....Present",
                          title: "Flutter Developer",
                          description:
                          "Working professionaly as a Flutter Developer (Mobile app developer Specialist). I successfully developed various projects, including a CRM app, iSocial app, task management app, and iContact app.",
                        ),
                        SizedBox(height: 15),
                        buildExperienceItem(
                          context,
                          date: "2022.....2023",
                          title: "Junior App Developer",
                          description:
                          "Working professionaly as a android app deveoper.",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                // Education
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.school, color: Colors.teal),
                            SizedBox(width: 6),
                            Text(
                              "EDUCATION",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Divider(
                          color: Color.fromRGBO(224, 224, 224, 1.0),
                          height: 0.5,
                        ),
                        // Experience details
                        buildExperienceItem(
                          context,
                          date: "2018.....2022",
                          title: "Bachelor of Science (BSc) Computer Science & Engineering (CSE)",
                          description:
                          "B.Sc in Computer Science & Engineering at Dhaka International University (DIU)",
                        ),
                        SizedBox(height: 15),
                        buildExperienceItem(
                          context,
                          date: "2016.....2017",
                          title: "Science",
                          description:
                          "Higher Secoundary School (HSC)",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget buildExperienceItem(BuildContext context, {
    required String date,
    required String title,
    required String description,
  })
  {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 17.0),
                child: Text(
                  date,
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
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
            "ihelpbd.png",
            fit: BoxFit.cover,
            width: 120,
            height: 40,
          ),
        ),
      ],
    );
  }
}
