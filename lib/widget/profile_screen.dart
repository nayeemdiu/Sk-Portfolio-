import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skportfolio/screen/about_me.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screen/contact_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isHireHovered = false;
  bool isContactHovered = false;
  late bool isVertical = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    isVertical = width < 600;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Top Banner with Logo
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                children: [
                  Container(
                    width: 210,
                    height: 210,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                      color: const Color(0x7296efec),
                      border: Border.all(
                        width: 4,
                        color: Colors.teal,
                      ),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/sk.png'),
                        fit: BoxFit.cover,
                        onError: (exception, stackTrace) {
                          print('Error loading image: $exception');
                        },
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
                    "I'm developing mobile app, frontend, and backend applications (Flutter)",
                    textAlign: isVertical ? TextAlign.center : TextAlign.start,
                    textStyle: GoogleFonts.delius(
                      color: Colors.blueGrey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Social Media Links
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                _buildSocialIcon(Icons.facebook, Colors.blue, "https://www.facebook.com/sknayeem.urrahman/"),
                _buildSocialIcon(Icons.link, Colors.green, "https://www.linkedin.com/in/sk-nayeem-ur-rahman-439783271/"),
                _buildSocialIcon(Icons.code, Colors.grey, "https://github.com/nayeemdiu"),
                _buildSocialIcon(Icons.telegram, Colors.lightBlueAccent, "https://t.me/your-telegram"),
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
                    _launchWhatsApp();
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPage()));
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

  // Function to launch URLs
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }


  // Widget to build social media icons with URL linking
  Widget _buildSocialIcon(IconData icon, Color color, String url) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Padding(
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
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            backgroundColor: isHovered ? Colors.teal.shade300 : Colors.teal,
            textStyle: const TextStyle(
              fontSize: 18,
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
Future<void> _launchWhatsApp() async {
  String url = 'https://wa.me/8801733367274?text=${Uri.encodeComponent}';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}