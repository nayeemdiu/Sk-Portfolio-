import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.white, Color(0xFFE0F2F1)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return constraints.maxWidth > 600
                          ? _buildWideLayout(context)
                          : _buildNarrowLayout(context);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: _buildContactInfo(),
        ),
        SizedBox(width: 50),
        Expanded(
          flex: 1,
          child: _buildContactForm(),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactInfo(),
        SizedBox(height: 30),
        _buildContactForm(),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Me',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.teal[800],
          ),
        ),
        SizedBox(height: 15),
        Text(
          'I would love to hear from you. Whether you have a question or just want to say hi, feel free to drop a message.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.blueGrey[700],
            height: 1.5,
          ),
        ),
        SizedBox(height: 30),
        _buildSocialMediaIcons(),
      ],
    );
  }

  Widget _buildContactForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildAnimatedTextField('Name', Icons.person),
        SizedBox(height: 20),
        _buildAnimatedTextField('Email', Icons.email),
        SizedBox(height: 20),
        _buildAnimatedTextField('Subject', Icons.subject),
        SizedBox(height: 20),
        _buildAnimatedMessageField(),
        SizedBox(height: 30),
        _buildSubmitButton(context),
      ],
    );
  }

  Widget _buildSocialMediaIcons() {
    final iconSize = 20.0;
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _buildSocialIcon(Icons.facebook, Colors.blue[700]!,
            'https://www.facebook.com/sknayeem.urrahman/', iconSize),
        _buildSocialIcon(
            Icons.link,
            Colors.blue[400]!,
            'https://www.linkedin.com/in/sk-nayeem-ur-rahman-439783271/',
            iconSize),
        _buildSocialIcon(Icons.code, Colors.black87,
            'https://github.com/nayeemdiu', iconSize),
        _buildSocialIcon(Icons.telegram, Colors.blue[300]!,
            'https://t.me/your-telegram', iconSize),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color, String url, double size) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(icon, color: color, size: size),
      ),
    );
  }

  Widget _buildAnimatedTextField(String hintText, IconData icon) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: _buildTextField(hintText, icon),
    );
  }

  Widget _buildTextField(String hintText, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: Colors.teal),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.teal.shade100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.teal, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.teal.shade100),
        ),
      ),
    );
  }

  Widget _buildAnimatedMessageField() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: TextField(
        maxLines: 5,
        decoration: InputDecoration(
          hintText: 'Your message...',
          prefixIcon: Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: Icon(Icons.message, color: Colors.teal),
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.teal.shade100),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.teal, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.teal.shade100),
          ),
        ),
      ),
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
        elevation: 3,
      ),
      child: Text(
        'Send Message',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}