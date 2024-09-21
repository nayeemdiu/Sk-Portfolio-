import 'package:flutter/material.dart';

/// Aboutme scction
class AboutMeSection extends StatefulWidget {
  @override
  _AboutMeSectionState createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    );
    _heightAnimation = Tween<double>(begin: 180, end: 220).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _opacityAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine device type based on screen width
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    bool isWeb = screenWidth >= 1024;

    // Set container width based on the device type
    double containerWidth;
    if (isMobile) {
      containerWidth = screenWidth * 0.9; // 90% of the screen width for mobile
    } else if (isTablet) {
      containerWidth = screenWidth * 0.75; // 75% of the screen width for tablets
    } else {
      containerWidth = 700; // Fixed width for web view
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6.0, left: 16, bottom: 16),
          child: Text(
            "About Me",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.teal[700],
              fontSize: isMobile ? 16 : 18, // Smaller font size on mobile
              letterSpacing: 1.2,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: MouseRegion(
            onEnter: (_) {
              setState(() => _isHovered = true);
              _controller.forward();
            },
            onExit: (_) {
              setState(() => _isHovered = false);
              _controller.reverse();
            },
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  width: containerWidth, // Set responsive width
                  height: _heightAnimation.value,
                  padding: EdgeInsets.all(isMobile ? 16 : 24), // Adjust padding for mobile
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.teal.shade50, Colors.white],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello! I'm Sk Nayeem Ur Rahman",
                        style: TextStyle(
                          color: Colors.teal[700],
                          fontSize: isMobile ? 18 : 20, // Smaller font size on mobile
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 16),
                      Opacity(
                        opacity: _opacityAnimation.value,
                        child: Text(
                          "I have a solid background in creating complex Mobile Applications (Flutter) for Android & iOS. "
                              "I can work independently and respect deadlines. I feel comfortable working with a good team of developers.",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: isMobile ? 14 : 16, // Adjust text size for mobile
                            height: 1.6,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
