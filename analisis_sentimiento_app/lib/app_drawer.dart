import 'package:flutter/material.dart';

/// Class to create a custom drawer for the app
class AppDrawer extends StatelessWidget {
  /// Constructor of the class
  const AppDrawer({super.key});

  /// Return a normal text span
  TextSpan normalTextSpan(String text) {
    return TextSpan(
      text: text,
      style: const TextStyle(color: Colors.black, fontSize: 15),
    );
  }

  /// Return a bold text span
  TextSpan boldTextSpan(String text) {
    return TextSpan(
      text: text,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );
  }

  /// Return an italic text span
  TextSpan italicTextSpan(String text) {
    return TextSpan(
      text: text,
      style: const TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.italic,
        fontSize: 15,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Return the drawer with the information
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(97, 10, 190, 1),
            ),
            child: Stack(
              children: [
                // Image of the logo
                Positioned.fill(
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          //  Information about the app
          ListTile(
            title: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                children: [
                  normalTextSpan('Welcome to '),
                  boldTextSpan('NewsSentiment'),
                  normalTextSpan(', an app created with '),
                  boldTextSpan('Flutter'),
                  normalTextSpan(
                      ' to explore the latest news from the main English newspapers, analyzed and classified by their '),
                  boldTextSpan('sentiment'),
                  normalTextSpan(
                      ' (positive, neutral or negative) using advenaced '),
                  boldTextSpan('artificial intelligence'),
                  normalTextSpan('. Through our API created with '),
                  boldTextSpan('FastAPI'),
                  normalTextSpan(
                      ', we obtain the news headlines, analyze their sentiment with the '),
                  italicTextSpan('FinBERT-tone'),
                  normalTextSpan(' model, and show you a summary with the '),
                  boldTextSpan('sentiment, accuracy and a direct link'),
                  normalTextSpan(
                      ' to the article. Simply click on the link icon to read more about the news that interests you. Stay informed with '),
                  boldTextSpan('relevant'),
                  normalTextSpan(' news and '),
                  boldTextSpan('accurate analysis'),
                  normalTextSpan(' instantly.'),
                ],
              ),
            ),
            // Close the drawer when the user taps on the item
            onTap: () {
              Navigator.pop(context);
            },
          ),
          // Information about the developers
          ListTile(
            title: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                children: [
                  normalTextSpan('This application was developed by:\n'),
                  boldTextSpan('• David Moreno Cerezo\n'),
                  normalTextSpan(
                      'API developer and responsible for the integration of the news scrapping system.\n\n'),
                  boldTextSpan('• Jairo Andrades Bueno\n'),
                  normalTextSpan(
                      'Mobile app developer and responsible for the implementation in Flutter.\n\n'),
                  boldTextSpan('• Both\n'),
                  normalTextSpan(
                      'Collaborative design of the app and joint development of the news scrapping system.'),
                ],
              ),
            ),
            // Close the drawer when the user taps on the item
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
