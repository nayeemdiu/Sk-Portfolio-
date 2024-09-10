import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  final Function(int) onItemSelected;

  MenuScreen({required this.onItemSelected});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // Track the selected index
  int selectedIndex = 0;

  // Update the selected index and call the parent function
  void selectItem(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 5, right: 5),
      child: Column(
        children: [
          // Header Menu Container
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            height: height * 0.20,
            width: width * 0.8,
            child: Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu, size: 22),
                  color: Colors.white,
                ),
                SizedBox(height: 7),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart, size: 22),
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(height: 3),
          // Main Menu Container
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            height: height * 0.65,
            width: width * 0.8,
            child: Column(
              children: [
                // Menu Items with Color Change Based on Selected Index
                buildMenuItem(0, Icons.account_balance_outlined, 'About'),
                buildMenuItem(1, Icons.medical_services_outlined, 'Services'),
                buildMenuItem(2, Icons.portrait, 'Resume'),
                buildMenuItem(3, Icons.work, 'Projects'),
                buildMenuItem(4, Icons.contact_emergency, 'Contact'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build each menu item
  Widget buildMenuItem(int index, IconData icon, String label) {
    final isSelected = index == selectedIndex;

    return InkWell(
      onTap: () {
        selectItem(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(
              icon,
              size: 22,
              color: isSelected ? Colors.teal : Colors.white, // Change color if selected
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: isSelected ? Colors.teal : Colors.white, // Change text color if selected
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
