import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFEFEFF), // Dark background
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0, right: 10, left: 10, bottom: 20),
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
          child: screenWidth > 600
              ? _buildWideLayout(context) // For tablets and larger screens
              : _buildNarrowLayout(context), // For mobile screens
        ),
      ),
    );
  }

  // Wide layout for larger screens
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
              _buildSocialMediaIcons(),
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
                _buildTextField('Name'),
                SizedBox(height: 15),
                _buildTextField('E-mail'),
                SizedBox(height: 15),
                _buildTextField('Subject'),
                SizedBox(height: 15),
                _buildMessageField(),
                SizedBox(height: 25),
                _buildSubmitButton(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Narrow layout for smaller screens
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
        _buildTextField('Name'),
        SizedBox(height: 15),
        _buildTextField('E-mail'),
        SizedBox(height: 15),
        _buildTextField('Subject'),
        SizedBox(height: 15),
        _buildMessageField(),
        SizedBox(height: 25),
        _buildSubmitButton(context),
      ],
    );
  }

  Widget _buildSocialMediaIcons() {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.facebook, color: Colors.teal),
          onPressed: () async {
            const url = 'https://www.facebook.com/sknayeem.urrahman/';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
        IconButton(
          icon: Icon(Icons.link, color: Colors.teal),
          onPressed: () async {
            //https://www.linkedin.com/in/sk-nayeem-ur-rahman-439783271/

            const url = 'https://www.linkedin.com/in/sk-nayeem-ur-rahman-439783271/';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
        IconButton(
          icon: Icon(Icons.code, color: Colors.teal),
          onPressed: () async {
           // https://github.com/nayeemdiu


            const url = 'https://github.com/nayeemdiu';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
            // Add a link or functionality here for email or another platform
          },
        ),
        IconButton(
          icon: Icon(Icons.telegram, color: Colors.teal),
          onPressed: () async {
            // https://github.com/nayeemdiu
            const url = 'https://t.me/your-telegram';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
            // Add a link or functionality here for email or another platform
          },
        ),
      ],
    );
  }

  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Color(0xFF2C2C3E), // Dark input field background
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
    final screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal, // Button color
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: Colors.teal.withOpacity(0.5),
        elevation: screenWidth > 600 ? 5 : 3,
      ),
      onPressed: () {
        // Handle submit action
      },
      child: Text(
        'Submit',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
