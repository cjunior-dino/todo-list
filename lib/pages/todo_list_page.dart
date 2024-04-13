import 'package:flutter/material.dart';
import 'package:lista/models/todo.dart';
import 'package:lista/widgets/todo_list_item.dart';

class TodoListPAGE extends StatefulWidget {
  TodoListPAGE({super.key});

  @override
  State<TodoListPAGE> createState() => _TodoListPAGEState();
}

class _TodoListPAGEState extends State<TodoListPAGE> {
  List<Todo> todos = [];
  Todo? deletedTodo;
  int? deletedTodoPos;

  final TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(
              16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todoController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione uma Tarefa',
                          hintText: 'Ex. Estudar Flutter,',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String text = todoController.text;
                        setState(
                          () {
                            Todo newTodo = Todo(
                              title: text,
                              dateTime: DateTime.now(),
                            );
                            todos.add(newTodo);
                          },
                        );
                        todoController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff00d7f3),
                        padding: EdgeInsets.all(20),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Todo todo in todos)
                        TodoListItem(
                          todo: todo,
                          onDelete: onDelete,
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Voce possui ${todos.length} tarefas pendentes',
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: showDeletetodosConfirmationDialog,
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff00d7f3),
                        padding: EdgeInsets.all(20),
                      ),
                      child: Text(
                        'Limpar Tudo,',
                        style: TextStyle(
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDelete(Todo todo) {
    deletedTodo = todo;
    deletedTodoPos = todos.indexOf(todo);

    setState(() {
      todos.remove(todo);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Tarefa ${todo.title} foi removida com sucesso!',
          style: TextStyle(
            color: Color(0xff000000),
          ),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: 'Defazer!!',
          textColor: Color(0xff000000),
          backgroundColor: Color(0xff00d7f3),
          onPressed: () {
            setState(() {
              todos.insert(deletedTodoPos!, deletedTodo!);
            });
          },
        ),
        duration: Duration(
          seconds: 5,
        ),
      ),
    );
  }

  void showDeletetodosConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Limpar Tudo ?'),
        content: Text(
          'Você tem certeza que quer limpar tudo ???',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              deleteAllTodos();
            },
            child: Text(
              'Limpar tudo',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancelar',
              style: TextStyle(
                color: Color(0xff00d7f3),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void deleteAllTodos() {
    setState(() {
      todos.clear();
    });
  }
}
