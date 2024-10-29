// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  bool _isSignUpMode = false; // Track whether to show login or signup form
  String? _errorMessage;

  void _toggleFormMode() {
    setState(() {
      _isSignUpMode = !_isSignUpMode;
      _errorMessage = null; // Reset error message when toggling forms
      _nameController.clear(); // Clear name field if switching to login
    });
  }

  Future<void> _submit() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final name = _nameController.text;

    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      if (_isSignUpMode) {
        // Sign up mode
        await authProvider.signup(email, password, name);
        // Successful signup will log the user in automatically
      } else {
        // Login mode
        await authProvider.login(email, password);
      }
    } catch (error) {
      setState(() {
        _errorMessage = error.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isSignUpMode ? '' : '')),
      body: SingleChildScrollView( // Added scroll view
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Allow column to take minimum space
            children: [
              // Welcome Text
              Text(
                'Welcome to Techtarium',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple),
              ),
              const SizedBox(height: 40), // Space between text and image
              
              // Displaying the image
              Image.asset(
                'assets/images/your_image.png', // Update this path to your image
                height: 100, // Adjust the height as needed
              ),
              const SizedBox(height: 40), // Space between image and form
              
              // Error message
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
                
              // Name field for signup
              if (_isSignUpMode)
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person), // Icon for name
                    border: OutlineInputBorder(), // Box around the text field
                  ),
                ),
              const SizedBox(height: 20), // Space between fields
              
              // Email field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email), // Icon for email
                  border: OutlineInputBorder(), // Box around the text field
                ),
              ),
              const SizedBox(height: 20), // Space between fields
              
              // Password field
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock), // Icon for password
                  border: OutlineInputBorder(), // Box around the text field
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              
              ElevatedButton(
                onPressed: _submit,
                child: Text(_isSignUpMode ? 'Sign Up' : 'Login'),
              ),
              TextButton(
                onPressed: _toggleFormMode,
                child: Text(_isSignUpMode
                    ? 'Already have an account? Login'
                    : 'Don’t have an account? Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
