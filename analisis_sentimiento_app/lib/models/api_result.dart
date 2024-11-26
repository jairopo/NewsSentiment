import 'new.dart';

class ApiResult {
  List<New> result = [];
  int amount = 0;

  ApiResult({
    required this.result,
    required this.amount,
  });

  // Default constructor
  ApiResult.empty();

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
