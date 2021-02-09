import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:jira_for_mobile/Models/Issue.dart';
import 'package:jira_for_mobile/Network/Responses/JiraTaskResponse.dart';

class Api {
  static String userInputUrl = "";
  static final String baseURL = "$userInputUrl/rest/api/3";
  static final String tasksURL = "$baseURL/search";

  Future<List<Issue>> getTasksList(
      String email, String token, String url, int startAt) async {
    JiraTaskResponse jiraTaskResponse;
    String userEmail = email;
    String userToken = token;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$userEmail:$userToken'));
    userInputUrl = url;

    Map<String, dynamic> queryParameters = {
      "startAt": startAt,
    };

    await Dio()
        .get(tasksURL,
            queryParameters: queryParameters,
            options: Options(headers: {'authorization': basicAuth}))
        .then((response) {
      if (response.statusCode == 200) {
        debugPrint(response.data.toString());
        jiraTaskResponse = JiraTaskResponse.fromJson(response.data);
        return jiraTaskResponse.issues;
      } else {
        throw ('Error ${response.statusMessage}');
      }
    }).catchError((onError) {
      if (onError is DioError) {
        throw (onError.message);
      }
      throw ('Error ${onError.toString()}');
    });

    return List();
  }
}
