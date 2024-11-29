import 'new.dart';

/// Class that represents the result of an API request
class ApiResult {
  /// List of news
  List<New> result = [];

  /// Amount of news
  int amount = 0;

  /// Constructor
  ApiResult({
    required this.result,
    required this.amount,
  });

  /// Default constructor
  ApiResult.empty();

  /// Method that creates an instance of the class from a JSON
  factory ApiResult.fromJson(Map<String, dynamic> json) {
    List<New> news = [];
    for (var item in json['result']) {
      news.add(New.fromJson(item));
    }
    return ApiResult(
      result: news,
      amount: json['amount'] as int,
    );
  }
}
