import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MyServices extends StatelessWidget {
  const MyServices({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _items = const [
    {
      'name': 'Mobile App Development',
      'icon': Icons.phone_android,
      'description': 'Developing high-quality mobile applications'
    },
    {
      'name': 'Web Design/Development',
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
          padding: const EdgeInsets.only(top: 50, right: 10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
            ),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 1500),
                columnCount: 2,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: HoverableServiceItem(item: _items[index]),
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

class HoverableServiceItem extends StatefulWidget {
  final Map<String, dynamic> item;

  const HoverableServiceItem({Key? key, required this.item}) : super(key: key);

  @override
  _HoverableServiceItemState createState() => _HoverableServiceItemState();
}

class _HoverableServiceItemState extends State<HoverableServiceItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isHovered
              ? Color.fromRGBO(220, 238, 237, 0.8)
              : Color.fromRGBO(220, 238, 237, 0.4470588235294118),
          border: Border.all(
            width: 0.5,
            color: Colors.teal,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? Colors.white.withOpacity(0.5)
                  : Colors.white.withOpacity(0.2),
              spreadRadius: isHovered ? 5 : 3,
              blurRadius: isHovered ? 20 : 15,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.item['icon'],
                size: isHovered ? 70 : 60,
                color: isHovered ? Colors.teal[900] : Colors.teal[800],
              ),
              const SizedBox(height: 12),
              Text(
                widget.item['name'],
                style: TextStyle(
                  color: isHovered ? Colors.black : Colors.black87,
                  fontSize: isHovered ? 20 : 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                widget.item['description'],
                style: TextStyle(
                  color: isHovered ? Colors.black87 : Colors.black54,
                  fontSize: isHovered ? 15 : 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}