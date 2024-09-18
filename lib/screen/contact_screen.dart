import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      duration: Duration(seconds: 1), // Animation duration
      vsync: this,
    );

    // Slide animation
    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFFEFEFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SlideTransition(
          position: _slideAnimation, // Apply the slide animation
          child: FadeTransition(
            opacity: _fadeAnimation, // Apply the fade animation
            child: SingleChildScrollView( // Add SingleChildScrollView
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: Colors.teal,
                  ),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: screenWidth > 600 ? _buildWideLayout(context) : _buildNarrowLayout(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Contact with me',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'For any service and work, you can contact with me by sending\nan email or through our social media accounts.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 20),
              _buildSocialMediaIcons(), // Add animation
            ],
          ),
        ),
        SizedBox(width: 50),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildAnimatedTextField('Name'),
                SizedBox(height: 15),
                _buildAnimatedTextField('E-mail'),
                SizedBox(height: 15),
                _buildAnimatedTextField('Subject'),
                SizedBox(height: 15),
                _buildAnimatedMessageField(),
                SizedBox(height: 25),
                _buildSubmitButton(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Contact with me',
            style: TextStyle(
              fontSize: 24,
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'For any service and work, you can contact with me by sending\nan email or through our social media accounts.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
        SizedBox(height: 20),
        _buildSocialMediaIcons(),
        SizedBox(height: 20),
        _buildAnimatedTextField('Name'),
        SizedBox(height: 15),
        _buildAnimatedTextField('E-mail'),
        SizedBox(height: 15),
        _buildAnimatedTextField('Subject'),
        SizedBox(height: 15),
        _buildAnimatedMessageField(),
        SizedBox(height: 25),
        _buildSubmitButton(context),
        SizedBox(height: 20), // Add some spacing at the bottom
      ],
    );
  }

  Widget _buildAnimatedTextField(String hintText) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: _buildTextField(hintText),
    );
  }

  Widget _buildAnimatedMessageField() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: _buildMessageField(),
    );
  }

  Widget _buildSocialMediaIcons() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.facebook, color: Colors.teal),
            onPressed: () {
              _launchURL('https://www.facebook.com/sknayeem.urrahman/');
            },
          ),
          IconButton(
            icon: Icon(Icons.link, color: Colors.teal),
            onPressed: () {
              _launchURL('https://www.linkedin.com/in/sk-nayeem-ur-rahman-439783271/');
            },
          ),
          IconButton(
            icon: Icon(Icons.code, color: Colors.teal),
            onPressed: () {
              _launchURL('https://github.com/nayeemdiu');
            },
          ),
          IconButton(
            icon: Icon(Icons.telegram, color: Colors.teal),
            onPressed: () {
              _launchURL('https://t.me/your-telegram');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Color(0xFF2C2C3E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.teal),
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildMessageField() {
    return TextField(
      maxLines: 6,
      decoration: InputDecoration(
        hintText: 'Type a message here...',
        hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Color(0xFF2C2C3E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.teal),
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add your submit action here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
      child: Center(
        child: Text(
          'Send',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
