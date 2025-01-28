class SignInRepository {
  Future<bool> login(String email, String password) async {
    // Mock logic
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    if (email == "test@email.com" && password == "password123") {
      return true;
    }
    return false;
  }
}
