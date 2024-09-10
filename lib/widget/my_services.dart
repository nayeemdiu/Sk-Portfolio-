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
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns
            crossAxisSpacing: 8.0, // Space between columns
            mainAxisSpacing: 8.0, // Space between rows
          ),
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 1500), // Slower animation duration
              columnCount: 3,
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 5, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(151, 222, 219, 0.4470588235294118),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(8, 8), // changes position of shadow
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _items[index]['icon'],
                            size: 50,
                            color: Colors.teal,
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              _items[index]['name'],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _items[index]['description'],
                            style: const TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 12,
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
    );
  }
}
