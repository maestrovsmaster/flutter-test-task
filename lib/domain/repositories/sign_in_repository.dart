import 'package:hive/hive.dart';

class SignInRepository {

  final Box _box = Hive.box('authBox');

  Future<bool> login(String email, String password) async {
    // Mock logic
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    if (email == "test@email.com" && password == "password123") {
      return true;
    }
    return false;
  }

  Future<void> setLoggedIn(bool isLogged) async {
    await _box.put('isLogged', isLogged);
  }

  Future<bool> getLoggedIn() async {
    return _box.get('isLogged', defaultValue: false);
  }

}
