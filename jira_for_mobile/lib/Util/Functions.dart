import 'package:flutter/cupertino.dart';

class Functions {
  static String checkApiError(e) {
    debugPrint(e.toString());
    if (isConnectionError(e)) {
      return "Connection Error";
    } else {
      if (e.toString().contains('401') || e.toString().contains('400')) {
        return "Error, Unauthorized client";
      }
    }
    return "Error, Try Again";
  }

  static bool isConnectionError(e) {
    if (e.toString().contains('SocketException') ||
        e.toString().contains('HandshakeException')) {
      return true;
    } else {
      return false;
    }
  }
}
