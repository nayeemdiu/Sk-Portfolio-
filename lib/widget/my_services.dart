import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MyServices extends StatefulWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> _items = [
    {
      'name': 'Mobile App Development',
      'icon': Icons.phone_android,
      'description': 'Developing high-quality mobile applications'
    },
    {
      'name': 'Web Design & Development',
      'icon': Icons.web,
      'description': 'Creating responsive and user-friendly websites'
    },
    {
      'name': 'Graphic Design',
      'icon': Icons.design_services,
      'description': 'Designing visually appealing graphics and logos'
    },
    {
      'name': 'App Published on Playstore',
      'icon': Icons.play_arrow,
      'description': 'Publishing apps on the Google Play Store'
    },
    {
      'name': 'Mobile App Development',
      'icon': Icons.phone_android,
      'description': 'Developing high-quality mobile applications'
    },
    {
      'name': 'Web Design & Development',
      'icon': Icons.web,
      'description': 'Creating responsive and user-friendly websites'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimationLimiter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns
              crossAxisSpacing: 12.0, // Space between columns
              mainAxisSpacing: 12.0, // Space between rows
            ),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 1500), // Updated animation duration
                columnCount: 3,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: GestureDetector(
                      onTap: () {
                        // Add any interaction logic here
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(0, 4), // Adjust shadow position
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              _items[index]['icon'],
                              size: 60, // Larger icon size
                              color: Colors.teal[800],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              _items[index]['name'],
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 18, // Increased font size
                                fontWeight: FontWeight.bold, // Bold text
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _items[index]['description'],
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 14, // Slightly larger font size
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
