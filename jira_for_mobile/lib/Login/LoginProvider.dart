import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool loading = false;

  void setDynamicLoading() {
    loading ? loading = false : loading = true;
    notifyListeners();
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }
}
