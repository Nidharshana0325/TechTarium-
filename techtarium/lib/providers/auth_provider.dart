import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techtarium/models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  final List<User> _users = []; // In-memory user storage

  User? get user => _user;

  // Load user data from SharedPreferences on startup
  Future<void> loadUserFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final name = prefs.getString('name');

    if (email != null && name != null) {
      _user = User(id: email, email: email, name: name, password: '');
      notifyListeners();
    }
  }

  Future<void> login(String email, String password) async {
    // Check if the user exists in the in-memory list
    final existingUser = _users.firstWhere(
      (user) => user.email == email,
      orElse: () => throw Exception('Account does not exist. Please sign up.'),
    );

    // Check password
    if (existingUser.password != password) {
      throw Exception('Invalid password');
    }

    // User found and password matches
    _user = existingUser;

    // Save user data to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', _user!.email);
    await prefs.setString('name', _user!.name);

    notifyListeners();
  }

  Future<void> signup(String email, String password, String name) async {
    // Check if user already exists
    if (_users.any((user) => user.email == email)) {
      throw Exception('Account already exists. Please log in.');
    }

    // Create a new user
    final newUser = User(
      id: email, // Use email as the ID for simplicity
      email: email,
      name: name,
      password: password, // Store the password
    );

    // Add the new user to the in-memory list
    _users.add(newUser);
    _user = newUser; // Log the user in after sign-up

    // Save user data to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', _user!.email);
    await prefs.setString('name', _user!.name);

    notifyListeners();
  }

  Future<void> logout() async {
    _user = null;

    // Clear user data from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('name');

    notifyListeners();
  }
}
