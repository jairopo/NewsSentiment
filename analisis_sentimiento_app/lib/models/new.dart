/// Class to represent a new
class New {
  /// Title of the new
  String title = '';

  /// Sentiment of the new
  String sentiment = '';

  /// Precision of the sentiment
  double precision = 0.0;

  /// URL of the new
  String link = '';

  /// Constructor
  New({
    required this.title,
    required this.sentiment,
    required this.precision,
    required this.link,
  });

  /// Method that creates an instance of the class from a JSON
  factory New.fromJson(Map<String, dynamic> json) {
    return New(
      title: json['title'],
      sentiment: json['sentiment'],
      precision: (json['precision'] as num).toDouble(),
      link: json['link'],
    );
  }
}
