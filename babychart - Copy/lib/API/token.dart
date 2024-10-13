class AuthToken {
  static final AuthToken _instance = AuthToken._internal();
  String token = '';

  factory AuthToken() {
    return _instance;
  }

  AuthToken._internal();
}
