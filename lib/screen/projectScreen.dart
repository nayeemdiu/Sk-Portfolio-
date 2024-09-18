import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Project {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> imageUrls;
  final Color color;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.imageUrls,
    required this.color,
  });
}

class ProjectScreen extends StatelessWidget {
  final List<Project> projects = [
    Project(
      title: 'E-commerce App',
      description: 'A full-featured online shopping experience',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg', 'assets/e5.jpg', 'assets/e6.jpg'],
      color: Colors.white,
    ),
    Project(
      title: 'Daily task traker App',
      description: 'A full-featured online shopping experience',
      imageUrl: 'assets/todo.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg', 'assets/e5.jpg', 'assets/e6.jpg'],
      color: Colors.white,
    ),
    Project(
      title: 'E-commerce App',
      description: 'A full-featured online shopping experience',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg', 'assets/e5.jpg', 'assets/e6.jpg'],
      color: Colors.white,
    ),
    Project(
      title: 'Daily task traker App',
      description: 'A full-featured online shopping experience',
      imageUrl: 'assets/todo.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg', 'assets/e5.jpg', 'assets/e6.jpg'],
      color: Colors.white,
    ),
    Project(
      title: 'E-commerce App',
      description: 'A full-featured online shopping experience',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg', 'assets/e5.jpg', 'assets/e6.jpg'],
      color: Colors.white,
    ),
    Project(
      title: 'Daily task traker App',
      description: 'A full-featured online shopping experience',
      imageUrl: 'assets/todo.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg', 'assets/e5.jpg', 'assets/e6.jpg'],
      color: Colors.white,
    ),
    Project(
      title: 'E-commerce App',
      description: 'A full-featured online shopping experience',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg', 'assets/e5.jpg', 'assets/e6.jpg'],
      color: Colors.white,
    ),
    Project(
      title: 'Daily task traker App',
      description: 'A full-featured online shopping experience',
      imageUrl: 'assets/todo.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg', 'assets/e5.jpg', 'assets/e6.jpg'],
      color: Colors.white,
    ),
    // Add other projects here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimationLimiter(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 25),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: constraints.maxWidth > 600 ? 3 : 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: projects.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 600),
                  columnCount: constraints.maxWidth > 600 ? 3 : 2,
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: ProjectCard(project: projects[index]),
                    ),
                  ),
                );
              },
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
    final double imageHeight = screenSize.width > 600 ? 160 : 100;

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
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
            color: Colors.teal,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? widget.project.color.withOpacity(0.4) : Colors.black.withOpacity(0.1),
              spreadRadius: _isHovered ? 10 : 0,
              blurRadius: 20,
              offset: Offset(0, 10),
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
                      color: Colors.teal,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
                    ),
                    child: Text(
                      widget.project.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.project.description,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        _showImageDialog(context, widget.project.imageUrls);
                      },
                      child: Text('View', style: TextStyle(fontSize: 14, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        backgroundColor: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
                                  width: screenSize.width > 600 ? 150 : 100,
                                  height: 100,
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
                        icon: Icon(Icons.close, color: Colors.teal),
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
