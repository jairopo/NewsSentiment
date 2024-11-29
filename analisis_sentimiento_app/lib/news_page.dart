import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'news_widget.dart';

/// News class to display news
class News extends StatefulWidget {
  /// Index of the current screen
  final int index;

  /// Constructor
  const News(this.index, {super.key});

  @override
  State<News> createState() => _NewsState();
}

/// State class for News
class _NewsState extends State<News> {
  /// Get the index of the current screen
  int get index => widget.index;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: widget.index,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'News',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromRGBO(97, 10, 190, 1),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const TabBar(
                tabs: [
                  // Title of the tabs
                  Tab(
                      child: Text('Positive',
                          style: TextStyle(
                              color: Color.fromARGB(255, 11, 174, 16)))),
                  Tab(
                      child: Text('Neutral',
                          style: TextStyle(
                              color: Color.fromARGB(255, 61, 61, 61)))),
                  Tab(
                      child: Text('Negative',
                          style: TextStyle(
                              color: Color.fromARGB(255, 227, 26, 12)))),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.grey[100],
          child: TabBarView(
            children: [
              buildNews(index, 'POSITIVE', context),
              buildNews(index, 'NEUTRAL', context),
              buildNews(index, 'NEGATIVE', context),
            ],
          ),
        ),
        drawer: const AppDrawer(),
      ),
    );
  }
}
