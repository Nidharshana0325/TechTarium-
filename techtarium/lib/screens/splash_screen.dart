import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtarium/providers/auth_provider.dart';
import 'package:techtarium/screens/home_screen.dart';
import 'package:techtarium/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        return auth.user == null ? const LoginScreen() : const HomeScreen();
      },
    );
  }
}
