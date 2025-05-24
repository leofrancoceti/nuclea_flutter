import 'package:flutter/material.dart';
import 'event_list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  String _error = '';

  void _login() {
    if (_userController.text == 'admin' && _passController.text == '1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const EventListScreen()),
      );
    } else {
      setState(() {
        _error = 'Usuario o contraseña incorrectos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text('Login', style: TextStyle(fontSize: 28)),
                const SizedBox(height: 40),
                TextField(
                  controller: _userController,
                  decoration: const InputDecoration(labelText: 'Usuario'),
                ),
                TextField(
                  controller: _passController,
                  decoration: const InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Ingresar'),
                ),
                if (_error.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(_error, style: const TextStyle(color: Colors.red)),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
