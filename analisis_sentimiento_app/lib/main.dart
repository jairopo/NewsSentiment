import 'package:analisis_sentimiento_app/navigator.dart';
import 'package:flutter/material.dart';

/// Main function
void main() {
  /// Run the application
  runApp(const MyApp());
}

/// Main application widget
class MyApp extends StatelessWidget {
  /// Constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NewsSentiment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Home page
      home: const NavigatorPage(initialIndex: 0),
    );
  }
}
