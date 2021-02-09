class User {
  User(String email, String token, String url, bool isLoggedIn) {
    this.email = email;
    this.token = token;
    this.url = url;
    this.isLoggedIn = isLoggedIn;
  }

  String email = '';
  String token = '';
  String url = '';
  bool isLoggedIn = false;
}
