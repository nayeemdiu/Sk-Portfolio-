import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isHireHovered = false; // State to track hover for "Hire Me"
  bool isContactHovered = false; // State to track hover for "Contact Me"
  late bool isVertical = false; // Initialize with a default value

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    // Set `isVertical` based on screen width (or any other logic you want)
    isVertical = width < 600;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Top Banner with Logo
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                children: [
                  Container(
                    width: 200, // Width and height of the container
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0x7296efec),
                      border: Border.all(
                        width: 4,
                        color: Colors.teal,
                      ),
                      shape: BoxShape.circle, // Makes the container circular
                      image: const DecorationImage(
                        image: AssetImage('nayeem1.jpg'),
                        fit: BoxFit.fill, // Ensures the image fits within the circle
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Name and Title
            Text(
              'Sk Nayeem Ur Rahman',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Colors.teal[900],
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: isVertical ? double.infinity : width * 0.29,
              height: 40,
              child: AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(seconds: 2),
                animatedTexts: [
                  TyperAnimatedText(
                      "I'm developing mobile app, frontend, and backend applications( Flutter )",
                      textAlign: isVertical ? TextAlign.center : TextAlign.start,
                      textStyle: GoogleFonts.getFont('Delius',
                          color: Colors.blueGrey,
                          fontSize: 15)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Social Media Links
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10.0, // Space between items horizontally
              runSpacing: 10.0, // Space between items vertically
              children: [
                _buildSocialIcon(Icons.facebook, Colors.blue),
                _buildSocialIcon(Icons.web, Colors.green),
                _buildSocialIcon(Icons.code, Colors.grey),
                _buildSocialIcon(Icons.telegram, Colors.lightBlueAccent),
                _buildSocialIcon(Icons.language, Colors.brown),
              ],
            ),

            const SizedBox(height: 30),

            // Hire Me and Contact Me Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildHoverableButton(
                  text: "Hire Me",
                  isHovered: isHireHovered,
                  onHover: (hovered) {
                    setState(() {
                      isHireHovered = hovered;
                    });
                  },
                  onPressed: () {
                    print("Hire Me button pressed");
                  },
                ),
                _buildHoverableButton(
                  text: "Contact Me",
                  isHovered: isContactHovered,
                  onHover: (hovered) {
                    setState(() {
                      isContactHovered = hovered;
                    });
                  },
                  onPressed: () {
                    print("Contact Me button pressed");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: color.withOpacity(0.2),
        child: Icon(
          icon,
          size: 15,
          color: color,
        ),
      ),
    );
  }

  // Hoverable Button with hover color effect
  Widget _buildHoverableButton({
    required String text,
    required bool isHovered,
    required Function(bool) onHover,
    required VoidCallback onPressed,
  }) {
    return MouseRegion(
      onEnter: (_) => onHover(true), // When mouse enters, set hover to true
      onExit: (_) => onHover(false), // When mouse exits, set hover to false
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            backgroundColor: isHovered ? Colors.teal.shade300 : Colors.teal, // Change color on hover
            textStyle: const TextStyle(
              fontSize: 18,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
