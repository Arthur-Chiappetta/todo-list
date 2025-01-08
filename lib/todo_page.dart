import 'package:flutter/material.dart';
import 'package:to_do_app/todo_form.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List<String> toDoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Center(
          child: Text(
            'ToDo List',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          final todo = toDoList[index];
          return Card(
            child: ListTile(leading: Text('${index + 1}'), title: Text(todo), onTap: () => deleteTask(context, index),),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newTask(context);
        },
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }

  void newTask(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ToDoForm()));

    if (result != null) {
      setState(() {
        toDoList.add(result);
      });
    }
  }

void deleteTask(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Task'),
          content: Text('Do you want to delete this task?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  toDoList.removeAt(index); // Remove o item da lista
                });
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
