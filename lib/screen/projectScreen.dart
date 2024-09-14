import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Project {
  final String title;
  final String description;
  final String imageUrl;
  final Color color;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.color,
  });
}

class ProjectScreen extends StatelessWidget {
  final List<Project> projects = [
    Project(
      title: 'E-commerce App',
      description: 'A full-featured online shopping experience',
      imageUrl: 'assets/e1.png',
      color: Colors.blue,
    ),
    Project(
      title: 'Weather Forecast',
      description: 'Real-time weather updates and forecasts',
      imageUrl: 'assets/e1.png',
      color: Colors.orange,
    ),
    Project(
      title: 'Task Manager',
      description: 'Organize your daily tasks efficiently',
      imageUrl: 'assets/e1.png',
      color: Colors.green,
    ),
    Project(
      title: 'Social Media Dashboard',
      description: 'Track your social media performance',
      imageUrl: 'assets/e1.png',
      color: Colors.purple,
    ),
    Project(
      title: 'Fitness Tracker',
      description: 'Monitor your workouts and health stats',
      imageUrl: 'assets/e1.png',
      color: Colors.red,
    ),
    Project(
      title: 'Recipe App',
      description: 'Discover and save your favorite recipes',
      imageUrl: 'assets/e1.png',
      color: Colors.teal,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Projects', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: AnimationLimiter(
        child: GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            //childAspectRatio: 0.7,
          ),
          itemCount: projects.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 500),
              columnCount: 3,
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
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: _isHovered ? (Matrix4.identity()..scale(1.05)) : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? widget.project.color.withOpacity(0.1) : Colors.black.withOpacity(0.1),
              spreadRadius: _isHovered ? 5 : 0,
              blurRadius: 10,
              offset: Offset(0, 5),
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
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: widget.project.color,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
                    ),
                    child: Text(
                      widget.project.title,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
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
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AnimatedOpacity(

                      duration: Duration(milliseconds: 300),
                      opacity: _isHovered ? 1.0 : 0.0,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('View', style: TextStyle(fontSize: 12,color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.project.color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
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
}

void main() {
  runApp(MaterialApp(
    title: 'Project Showcase',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: ProjectScreen(),
  ));
}