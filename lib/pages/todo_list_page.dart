import 'package:flutter/material.dart';

class TodoListPAGE extends StatelessWidget {
  const TodoListPAGE({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              labelText: "E-mail",
              hintText: 'exemplo@exemplo.com',
              //border: OutlineInputBorder(),
            ),
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
