class AuthService {
  static const String dummyEmail = "test@email.com";
  static const String dummyPassword = "123456";

  Future<String?> login(String email, String password) async {
    if (email == dummyEmail && password == dummyPassword) {
      return null; // Success
    }
    return "Invalid email or password";
  }

  Future<String?> register(String email, String password) async {
    return null; // Registration always succeeds (Dummy Logic)
  }
}
