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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: News(_selectedIndex),
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
              GButton(
                icon: Icons.home,
                iconActiveColor: Colors.transparent,
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: (_selectedIndex == 0)
                          ? const Color.fromRGBO(161, 0, 254, 1)
                          : Colors.white,
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/bbc.jpg'),
                    backgroundColor: Colors.black,
                  ),
                ),
                text: 'BBC',
              ),
              GButton(
                icon: Icons.home,
                iconActiveColor: Colors.transparent,
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: (_selectedIndex == 1)
                          ? const Color.fromRGBO(161, 0, 254, 1)
                          : Colors.white,
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/nytimes.png'),
                    backgroundColor: Colors.black,
                  ),
                ),
                text: 'NY Times',
              ),
              GButton(
                icon: Icons.home,
                iconActiveColor: Colors.transparent,
                leading: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: (_selectedIndex == 2)
                          ? const Color.fromRGBO(161, 0, 254, 1)
                          : Colors.white,
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/cnn.png'),
                    backgroundColor: Colors.black,
                  ),
                ),
                text: 'CNN',
              ),
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
