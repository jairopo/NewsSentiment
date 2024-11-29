// ignore_for_file: use_build_context_synchronously

import 'package:analisis_sentimiento_app/utilities.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/api_result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// API result
ApiResult _apiResult = ApiResult.empty();

/// Error message
String _error = '';

/// URL of the API
const url = 'http://81.37.4.190:8000/scrapping_';

/// Get the API result
Future<void> _getApiResult(int index, BuildContext context) async {
  // Set the URL based on the index
  _error = '';
  _apiResult = ApiResult.empty();
  String newspaper = 'bbc';
  if (index == 1) {
    newspaper = 'nytimes';
  } else if (index == 2) {
    newspaper = 'cnn';
  }

  // Get the data from the API
  try {
    final response = await http.get(Uri.parse(url + newspaper));
    if (response.statusCode == 200) {
      String decodedResponse = utf8.decode(response.bodyBytes);
      _apiResult = ApiResult.fromJson(jsonDecode(decodedResponse));
    } else {
      _error = 'Error getting the data';
    }
  } catch (e) {
    // Error handling
    _error = 'Error loading the API';
  }
}

/// Get the news based on the sentiment
Future<ApiResult> _getNews(
    int index, String sentiment, BuildContext context) async {
  await _getApiResult(index, context);
  final positiveNews = _apiResult.result
      .where((element) => element.sentiment == sentiment)
      .toList();
  return ApiResult(result: positiveNews, amount: positiveNews.length);
}

/// Build the news widget containing the list of news
FutureBuilder<ApiResult> buildNews(
    int index, String sentiment, BuildContext context) {
  return FutureBuilder<ApiResult>(
    future: _getNews(index, sentiment, context),
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
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.result.length + 1,
                itemBuilder: (context, index) {
                  // Amount of news
                  if (index == 0) {
                    return Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      width: double.infinity,
                      child: Text(
                        '${snapshot.data!.amount} news',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else {
                    // New object
                    final n = snapshot.data!.result[index - 1];
                    // News item
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
                            maxLines: 2,
                            textAlign: TextAlign.justify,
                          ),
                          subtitle: Text('${n.precision.toString()}%'),
                          // Open the news in the browser
                          trailing: IconButton(
                            icon: const Icon(Icons.open_in_new,
                                color: Color.fromRGBO(255, 184, 0, 1)),
                            onPressed: () async {
                              final url = Uri.parse(n.link);
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url,
                                    mode: LaunchMode.platformDefault);
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
                  }
                },
              ),
            ),
          ],
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
