import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Project {
  final String title;
  final String description;
  final String imageUrl;

  Project({required this.title, required this.description, required this.imageUrl});
}

class ProjectScreen extends StatelessWidget {
  final List<Project> projects = [
    Project(
      title: 'E-commerce App',
      description: 'A full-featured online shopping experience',
      imageUrl: 'assets/e1.png',
    ),
    Project(
      title: 'Weather Forecast',
      description: 'Real-time weather updates and forecasts',
      imageUrl: 'assets/e1.png',
    ),
    Project(
      title: 'Task Manager',
      description: 'Organize your daily tasks efficiently',
      imageUrl: 'assets/e1.png',
    ),
    Project(
      title: 'Social Media Dashboard',
      description: 'Track your social media performance',
      imageUrl: 'assets/e1.png',
    ),
    Project(
      title: 'Fitness Tracker',
      description: 'Monitor your workouts and health stats',
      imageUrl: 'assets/e1.png',
    ),
    Project(
      title: 'Recipe App',
      description: 'Discover and save your favorite recipes',
      imageUrl: 'assets/e1.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: GridView.builder(
          padding: EdgeInsets.only(top: 50,right: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing:8,
            mainAxisSpacing: 8,
          ),
          itemCount: projects.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 800),
              columnCount: 2,
              child: ScaleAnimation(
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

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: Colors.teal,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              project.imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Expanded(
                    child: Text(
                      project.description,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}