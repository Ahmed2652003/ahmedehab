import 'package:day13/widget/register.dart';
import 'package:flutter/material.dart';

import '../widget/login_bottom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => const LoginButtomSheet());
                  },
                  child: const Text("Login")),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => const RegisterButtomSheet());
                  },
                  child: const Text("Register")),
            ],
          ),
        ));
  }
}
