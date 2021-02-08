import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool loading = false;

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
