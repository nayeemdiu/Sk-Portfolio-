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
    double screenWidth = MediaQuery.of(context).size.width;

    // Define grid columns and spacing based on screen width
    int crossAxisCount = screenWidth < 600
        ? 2 // Mobile view
        : (screenWidth < 1200 ? 3 : 3); // Web view will always have 3 columns
    double crossAxisSpacing = screenWidth < 600 ? 8.0 : 16.0;
    double mainAxisSpacing = screenWidth < 600 ? 8.0 : 16.0;

    return Expanded(
      child: AnimationLimiter(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 50, right: 10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: crossAxisSpacing,
              mainAxisSpacing: mainAxisSpacing,
            ),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 1500),
                columnCount: crossAxisCount,
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
    double screenWidth = MediaQuery.of(context).size.width;

    // Use different scaling factors for font sizes based on screen size
    double baseFontSize = screenWidth < 600
        ? 12 // Mobile view
        : (screenWidth < 1200 ? 14 : 16); // Web and tablet view

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isHovered
              ? Color.fromRGBO(204, 238, 236, 0.4470588235294118)
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
          padding: EdgeInsets.all(screenWidth < 600 ? 6.0 : 12.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              double maxHeight = constraints.maxHeight;
              double iconSize = isHovered
                  ? (screenWidth < 600 ? maxHeight * 0.3 : maxHeight * 0.35)
                  : (screenWidth < 600 ? maxHeight * 0.25 : maxHeight * 0.3);
              double titleSize = isHovered
                  ? baseFontSize * 1.3
                  : baseFontSize * 1.2; // Title size scaling
              double descSize = isHovered
                  ? baseFontSize * 1.1
                  : baseFontSize * 0.95; // Description size scaling

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    widget.item['icon'],
                    size: iconSize,
                    color: isHovered ? Colors.teal[900] : Colors.teal[800],
                  ),
                  SizedBox(height: maxHeight * 0.05),
                  Text(
                    widget.item['name'],
                    style: TextStyle(
                      color: isHovered ? Colors.black : Colors.black87,
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: maxHeight * 0.03),
                  Expanded(
                    child: Text(
                      widget.item['description'],
                      style: TextStyle(
                        color: isHovered ? Colors.black87 : Colors.black54,
                        fontSize: descSize,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
