import 'package:flutter/material.dart';
import 'package:flutter_assignment/providers/app_data_provider.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  _onRegisteringUser() {
    if (formKey.currentState!.validate()) {
      Provider.of<AppDataProvider>(context, listen: false).registerUser(
        usernameController.text.trim(),
        passwordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                onPressed: _onRegisteringUser,
                child: const Text('Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
