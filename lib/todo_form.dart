import 'package:flutter/material.dart';

class ToDoForm extends StatefulWidget {
  const ToDoForm({super.key});

  @override
  State<ToDoForm> createState() => _ToDoFormState();
}

class _ToDoFormState extends State<ToDoForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _newTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Center(
          child: Text(
            'ToDo List',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _newTaskController,
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Required Field';
                  }
                  return null;
                },              
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, _newTaskController.text);
                  }
                },
                child: Text('Add new task')
              )
            ],
          ),
        ),
      ),
    );
  }
}