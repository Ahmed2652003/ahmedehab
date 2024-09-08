import 'package:flutter/material.dart';

import '../controllers/user_controller.dart';

class LoginButtomSheet extends StatefulWidget {
  const LoginButtomSheet({super.key});

  @override
  State<LoginButtomSheet> createState() => _LoginButtomSheetState();
}

class _LoginButtomSheetState extends State<LoginButtomSheet> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwardController = TextEditingController();

  final _userController = UserController();

  void _submit() {
    if (_formKey.currentState!.validate() ?? false) {
      final user = _userController.createUser(
          _usernameController.text, _passwardController.text);
      print("Logged in as $user.username");
      Navigator.pop(context);
    }
    print("Login is field");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: "Username"),
              controller: _usernameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Username is required";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Passward"),
              controller: _passwardController,
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Passward is required";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: _submit, child: const Text("Login")),
          ],
        ),
      ),
    );
  }
}
