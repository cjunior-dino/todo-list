import 'package:flutter/material.dart';

class TodoListPAGE extends StatelessWidget {
  TodoListPAGE({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "E-mail",
                ),
              ),
              ElevatedButton(
                onPressed: login,
                child: Text(
                  'Entrar',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void login() {
  print('Entrar');
}
