import 'package:analisis_sentimiento_app/news_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

/// Navigator class to handle navigation between screens
class NavigatorPage extends StatefulWidget {
  /// Index of the initial screen
  final int initialIndex;

  /// Constructor
  const NavigatorPage({super.key, required this.initialIndex});

  @override
  State<NavigatorPage> createState() => _NavigatorState();
}

/// State class for NavigatorPage
class _NavigatorState extends State<NavigatorPage> {
  /// Index of the current screen
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Set the initial index
    _selectedIndex = widget.initialIndex;
  }

  /// Build the navigator button
  buildGButton(String text, int index, String image) {
    return GButton(
      // Set the icon transparent
      icon: Icons.home,
      iconActiveColor: Colors.transparent,
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // Set the border color based on the selected index
          border: Border.all(
            color: (_selectedIndex == index)
                // If the index is selected, set the color to purple, else white
                ? const Color.fromRGBO(161, 0, 254, 1)
                : Colors.white,
            width: 2,
          ),
        ),
        // Image of the newspaper
        child: CircleAvatar(
          backgroundImage: AssetImage(image),
          backgroundColor: Colors.black,
        ),
      ),
      // Name of the newspaper
      text: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Create a scaffold with the news widget and the bottom navigation bar
    return Scaffold(
      // Set the body to the news widget
      body: News(_selectedIndex),
      // Set the bottom navigation bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.5),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          // Create a Google Navigation Bar
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            color: Colors.white,
            iconSize: 24,
            padding: const EdgeInsets.all(12),
            duration: const Duration(milliseconds: 800),
            tabs: [
              // Create the buttons for each newspaper
              buildGButton('BBC', 0, 'assets/bbc.jpg'),
              buildGButton('NY Times', 1, 'assets/nytimes.png'),
              buildGButton('CNN', 2, 'assets/cnn.png'),
            ],
            selectedIndex: _selectedIndex,
            // Set the selected index when the tab is changed
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
