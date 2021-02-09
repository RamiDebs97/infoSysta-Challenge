import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jira_for_mobile/Models/Issue.dart';
import 'package:jira_for_mobile/Network/API.dart';

class LoginProvider extends ChangeNotifier {
  String email, token, url;
  bool loading = false;
  Api apiService = Api();
  int startAt = 0;

  Future<List<Issue>> getListOfTasks() async {
    await apiService.getTasksList(email, token, url, startAt).then((response) {
      return response != null ? response : List();
    }).catchError((onError) {
      if (onError is DioError) {
        throw ("Error " + onError.message.toString());
      }
      throw ("Error " + onError.toString());
    });
    return null;
  }

  void setEmail(newValue) {
    email = newValue;
    notifyListeners();
  }

  void setUrl(newValue) {
    url = newValue;
    notifyListeners();
  }

  void setToken(newValue) {
    token = newValue;
    notifyListeners();
  }

  void setDynamicLoading() {
    loading ? loading = false : loading = true;
    notifyListeners();
  }

  String validateEmail(email) {
    return email.toString().length > 0
        ? RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(email)
            ? null
            : "Invalid Email"
        : "Can not be Empty";
  }

  String validateUrl(url) {
    return url.toString().length > 0
        ? Uri.parse(url).isAbsolute
            ? null
            : "Invalid Url"
        : "Can not be Empty";
  }

  String validateToken(token) {
    return token.toString().length > 0 ? null : "Enter Token";
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }
}
