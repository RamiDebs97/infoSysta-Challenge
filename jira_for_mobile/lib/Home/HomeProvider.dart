import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jira_for_mobile/Core%20Component/enum/page_state.dart';
import 'package:jira_for_mobile/Memory/SharedPreferenceWrapper.dart';
import 'package:jira_for_mobile/Models/Issue.dart';
import 'package:jira_for_mobile/Models/User.dart';
import 'package:jira_for_mobile/Network/API.dart';
import 'package:jira_for_mobile/Util/Functions.dart';

class HomeProvider extends ChangeNotifier {
  User user;
  String errorMessage;
  PageState pageState = PageState.LOADED;
  String email, token, url;
  bool loading = false;
  Api apiService = Api();
  //needed for pagination later on
  int startAt = 0;

  Future<List<Issue>> getListOfTasks() async {
    setPageState(PageState.LOADING);
    user = await SharedPreferenceWrapper.getUserData();
    List<Issue> listOfTasks = List();
    listOfTasks = await apiService
        .getTasksList(user.email, user.token, user.url, startAt)
        .catchError((onError) {
      debugPrint(onError.toString());
      if (onError is DioError) {
        setErrorMessage(Functions.checkApiError(onError));
        setPageState(PageState.ERROR);
        throw ("Error " + onError.message.toString());
      }
      setErrorMessage(Functions.checkApiError(onError));
      setPageState(PageState.ERROR);
      throw ("Error " + onError.toString());
    });
    if (listOfTasks.isEmpty) {
      setPageState(PageState.NO_DATA);
    } else {
      setPageState(PageState.LOADED);
    }
    return listOfTasks;
  }

  void setPageState(PageState pageState) {
    this.pageState = pageState;
    notifyListeners();
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setErrorMessage(String value) {
    errorMessage = value;
    notifyListeners();
  }
}
