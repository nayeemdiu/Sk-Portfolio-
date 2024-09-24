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

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

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
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _launchWhatsApp() async {
    String message =
        'Name: ${_nameController.text}\n'
        'Email: ${_emailController.text}\n'
        'Subject: ${_subjectController.text}\n'
        'Message: ${_messageController.text}';
    String url = 'https://wa.me/8801733367274?text=${Uri.encodeComponent(message)}';
    if (await canLaunch(url)) {
      await launch(url);
      _clearFields();
      _showSnackbar(context,'Message sent successfully!',);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _clearFields() {
    _nameController.clear();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();
  }


  void _showSnackbar(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).viewPadding.top + 20, // Place it below the status bar
        left: 20,
        right: 20,
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(15),
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              message,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );

    overlay?.insert(overlayEntry);

    // Automatically remove the SnackBar after a delay
    Future.delayed(Duration(seconds: 15)).then((value) {
      overlayEntry.remove();
    });
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildAnimatedTextField('Name', Icons.person, _nameController),
          SizedBox(height: 20),
          _buildAnimatedTextField('Email', Icons.email, _emailController, isEmail: true),
          SizedBox(height: 20),
          _buildAnimatedTextField('Subject', Icons.subject, _subjectController),
          SizedBox(height: 20),
          _buildAnimatedMessageField(),
          SizedBox(height: 30),
          _buildSubmitButton(context),
        ],
      ),
    );
  }

  Widget _buildSocialMediaIcons() {
    final iconSize = 20.0;
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _buildSocialIcon(Icons.facebook, Colors.blue[700]!, 'https://www.facebook.com/sknayeem.urrahman/', iconSize),
        _buildSocialIcon(Icons.link, Colors.blue[400]!, 'https://www.linkedin.com/in/sk-nayeem-ur-rahman-439783271/', iconSize),
        _buildSocialIcon(Icons.code, Colors.black87, 'https://github.com/nayeemdiu', iconSize),
        _buildSocialIcon(Icons.telegram, Colors.blue[300]!, 'https://t.me/your-telegram', iconSize),
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

  Widget _buildAnimatedTextField(String hintText, IconData icon, TextEditingController controller, {bool isEmail = false}) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: TextFormField(
        controller: controller,
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
        validator: isEmail
            ? (value) {
          if (value == null || value.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return 'Please enter a valid email';
          }
          return null;
        }
            : (value) {
          if (value == null || value.isEmpty) {
            return 'This field cannot be empty';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildAnimatedMessageField() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: TextFormField(
        controller: _messageController,
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a message';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _launchWhatsApp();
        }
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

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
