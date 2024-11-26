// ignore_for_file: use_build_context_synchronously

import 'package:analisis_sentimiento_app/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/api_result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

ApiResult _apiResult = ApiResult.empty();
String _error = '';

/// Get the API result
Future<void> _getApiResult(int index, BuildContext context) async {
  // Set the URL based on the index
  _error = '';
  _apiResult = ApiResult.empty();
  String url = 'http://81.37.2.235:8000/scrapping/bbc';
  if (index == 1) {
    url = '';
  } else if (index == 2) {
    url = 'http://81.37.2.235:8000/scrapping_CNN';
  }

  // Get the data from the API
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      _apiResult = ApiResult.fromJson(jsonDecode(response.body));
    } else {
      _error = 'Error getting the data';
    }
  } catch (e) {
    // Error handling
    _error = 'Error loading the API';
  }
}

/// Get the news with based on the sentiment
Future<ApiResult> _getPositiveNews(
    int index, String sentiment, BuildContext context) async {
  await _getApiResult(index, context);
  final positiveNews = _apiResult.result
      .where((element) => element.sentiment == sentiment)
      .toList();
  return ApiResult(result: positiveNews, amount: positiveNews.length);
}

FutureBuilder<ApiResult> buildNews(
    int index, String sentiment, BuildContext context) {
  return FutureBuilder<ApiResult>(
    future: _getPositiveNews(index, sentiment, context),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Loading indicator
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (snapshot.hasError) {
        // Error handling
        return Center(
          child: Text('Error: ${snapshot.error}'),
        );
      } else if (snapshot.hasData && snapshot.data!.result.isNotEmpty) {
        // List of news
        return ListView.builder(
          itemCount: snapshot.data!.result.length,
          itemBuilder: (context, index) {
            final n = snapshot.data!.result[index];
            return Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(
                    n.title,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 1,
                  ),
                  subtitle: Text('${n.precision.toString()}%'),
                  trailing: IconButton(
                    icon: const Icon(Icons.open_in_new),
                    onPressed: () async {
                      final url = Uri.parse(n.link);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url, mode: LaunchMode.platformDefault);
                      } else {
                        // Error opening the URL
                        Utilities.showSnackBar(
                            context, 'Error opening the URL', true);
                      }
                    },
                  ),
                ),
              ),
            );
          },
        );
      } else {
        // No data found / error
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(_error.isEmpty ? 'No news found' : _error),
          ),
        );
      }
    },
  );
}
