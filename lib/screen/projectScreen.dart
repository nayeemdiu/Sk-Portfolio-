import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Project {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> imageUrls;
  final Color color;
  final Color buttonColor;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.imageUrls,
    required this.color,
    required this.buttonColor,
  });
}

class ProjectScreen extends StatelessWidget {
  final List<Project> projects = [
    Project(
      title: 'E-commerce App',
      description: 'A full-featured online shopping experience',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg', 'assets/e5.jpg', 'assets/e6.jpg'],
      color: Colors.blue.shade50,
      buttonColor: Colors.blue,
    ),
    Project(
      title: 'Social Media App',
      description: 'Connect with friends and share your moments',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg'],
      color: Colors.green.shade50,
      buttonColor: Colors.green,
    ),
    Project(
      title: 'Fitness Tracker',
      description: 'Monitor your health and fitness goals',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg'],
      color: Colors.orange.shade50,
      buttonColor: Colors.orange,
    ),
    Project(
      title: 'Recipe App',
      description: 'Discover and share delicious recipes',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg'],
      color: Colors.purple.shade50,
      buttonColor: Colors.purple,
    ),
    Project(
      title: 'E-commerce App',
      description: 'A full-featured online shopping experience',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg', 'assets/e5.jpg', 'assets/e6.jpg'],
      color: Colors.blue.shade50,
      buttonColor: Colors.blue,
    ),
    Project(
      title: 'Social Media App',
      description: 'Connect with friends and share your moments',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg'],
      color: Colors.green.shade50,
      buttonColor: Colors.green,
    ),
    Project(
      title: 'Fitness Tracker',
      description: 'Monitor your health and fitness goals',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg'],
      color: Colors.orange.shade50,
      buttonColor: Colors.orange,
    ),
    Project(
      title: 'Recipe App',
      description: 'Discover and share delicious recipes',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg'],
      color: Colors.purple.shade50,
      buttonColor: Colors.purple,
    ),
    Project(
      title: 'E-commerce App',
      description: 'A full-featured online shopping experience',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg', 'assets/e5.jpg', 'assets/e6.jpg'],
      color: Colors.blue.shade50,
      buttonColor: Colors.blue,
    ),
    Project(
      title: 'Social Media App',
      description: 'Connect with friends and share your moments',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg'],
      color: Colors.green.shade50,
      buttonColor: Colors.green,
    ),
    Project(
      title: 'Fitness Tracker',
      description: 'Monitor your health and fitness goals',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg'],
      color: Colors.orange.shade50,
      buttonColor: Colors.orange,
    ),
    Project(
      title: 'Recipe App',
      description: 'Discover and share delicious recipes',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg'],
      color: Colors.purple.shade50,
      buttonColor: Colors.purple,
    ),
    Project(
      title: 'E-commerce App',
      description: 'A full-featured online shopping experience',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg', 'assets/e5.jpg', 'assets/e6.jpg'],
      color: Colors.blue.shade50,
      buttonColor: Colors.blue,
    ),
    Project(
      title: 'Social Media App',
      description: 'Connect with friends and share your moments',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg'],
      color: Colors.green.shade50,
      buttonColor: Colors.green,
    ),
    Project(
      title: 'Fitness Tracker',
      description: 'Monitor your health and fitness goals',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg'],
      color: Colors.orange.shade50,
      buttonColor: Colors.orange,
    ),
    Project(
      title: 'Recipe App',
      description: 'Discover and share delicious recipes',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg'],
      color: Colors.purple.shade50,
      buttonColor: Colors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight - 20, // Reduced padding
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10), // Reduced padding
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 290, // Slightly reduced item extent
                    diameterRatio: 2.0,
                    offAxisFraction: -0.5,
                    physics: FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: projects.length,
                      builder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 200),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: ProjectCard(project: projects[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width <= 600;
    final double imageHeight = isSmallScreen ? 110 : 170; // Further reduced height

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5), // Reduced vertical padding
      child: MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          transform: _isHovered ? (Matrix4.identity()..scale(1.05)) : Matrix4.identity(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [_isHovered ? widget.project.color.withOpacity(0.9) : Colors.white, widget.project.color.withOpacity(0.6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              width: 0.5,
              color: widget.project.buttonColor,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: _isHovered ? widget.project.color.withOpacity(0.4) : Colors.black.withOpacity(0.1),
                spreadRadius: _isHovered ? 5 : 0, // Reduced spread
                blurRadius: 15, // Reduced blur
                offset: Offset(0, 5), // Reduced offset
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.asset(
                      widget.project.imageUrl,
                      height: imageHeight,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: widget.project.buttonColor,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
                      ),
                      child: Text(
                        widget.project.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: isSmallScreen ? 12 : 14, // Slightly reduced font size
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(isSmallScreen ? 8 : 12), // Reduced padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.project.description,
                        style: TextStyle(fontSize: isSmallScreen ? 12 : 14, color: Colors.grey[700]), // Reduced font size
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: isSmallScreen ? 5 : 10), // Reduced spacing
                      ElevatedButton(
                        onPressed: () {
                          _showImageDialog(context, widget.project.imageUrls);
                        },
                        child: Text('View', style: TextStyle(fontSize: isSmallScreen ? 12 : 14, color: Colors.white)), // Reduced font size
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 12 : 16, vertical: isSmallScreen ? 8 : 10), // Reduced padding
                          backgroundColor: widget.project.buttonColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  void _showImageDialog(BuildContext context, List<String> imageUrls) {
    final screenSize = MediaQuery.of(context).size;
    final double dialogWidth = screenSize.width > 600 ? 500 : screenSize.width - 40;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(milliseconds: 300),
                child: Container(
                  width: dialogWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Images',
                        style: TextStyle(
                          fontSize: screenSize.width > 600 ? 24 : 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: imageUrls.map((url) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Image.asset(
                                  url,
                                  width: screenSize.width > 600 ? 150 : 200,
                                  height: MediaQuery.sizeOf(context).height*0.50,
                                  fit: BoxFit.cover,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.close, color: widget.project.buttonColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}