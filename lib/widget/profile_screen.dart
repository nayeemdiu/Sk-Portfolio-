import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreeen extends StatefulWidget {
  const ProfileScreeen({Key? key}) : super(key: key);

  @override
  State<ProfileScreeen> createState() => _ProfileScreeenState();
}

class _ProfileScreeenState extends State<ProfileScreeen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Top Banner with Logo
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.0),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(8, 8), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image.asset('nayeem2.png',height: 200,width: 250,),
                  ),
                  SizedBox(height: 10),

                ],
              ),
            ),
            SizedBox(height: 20),
            // Name and Title
            Text(
              'Sk Nayeem Ur Rahman',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),


            Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 16),
            // Social Media Links
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon(Icons.facebook),
                _buildSocialIcon(Icons.web),
                _buildSocialIcon(Icons.code),
                _buildSocialIcon(Icons.photo),
                _buildSocialIcon(Icons.message),
                _buildSocialIcon(Icons.telegram),
                _buildSocialIcon(Icons.language),
              ],
            ),
            SizedBox(height: 20),
            // Hire Me and Contact Me Buttons
              Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjust alignment as needed
        children: [
          Container(
            width: 200,
            child: TextButton(
              onPressed: () {
                // Your action for "Hire Me" button
                print("Hire Me button pressed");
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal.withOpacity(0.7),
                side: const BorderSide(color: Colors.black, width: 0.5),
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18, // Adjust font size
                ),
              ),
              child: const Text("Hire Me"),
            ),
          ),
          Container(
            width: 200,
            child: TextButton(
              onPressed: () {
                // Your action for "Contact Me" button
                print("Contact Me button pressed");
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal.withOpacity(0.7),
                side: const BorderSide(color: Colors.black, width: 0.5),
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18, // Adjust font size
                ),
              ),
              child: const Text("Contact Me"),
            ),
          ),
        ],
      ),

      ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        icon,
        size: 30,
        color: Colors.black,
      ),
    );
  }
}
