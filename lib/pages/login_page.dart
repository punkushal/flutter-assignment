import 'package:flutter/material.dart';
import 'package:flutter_assignment/providers/app_data_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  onLoggedIn() {
    if (formKey.currentState!.validate()) {
      Provider.of<AppDataProvider>(context, listen: false)
          .loginUser(usernameController.text, passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: "username",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "This field must not be empty";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "password",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "This field must not be empty";
                }
                return null;
              },
            ),
            TextButton(
              onPressed: onLoggedIn,
              child: const Text('Login up'),
            ),
          ],
        ),
      ),
    );
  }
}
