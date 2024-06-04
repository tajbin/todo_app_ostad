import 'package:flutter/material.dart';
import '../../entities/todo.dart';

class AddNewTodoScreens extends StatefulWidget {
  const AddNewTodoScreens({super.key, required this.onAddTodo});

  final Function(Todo) onAddTodo;

  @override
  State<AddNewTodoScreens> createState() => _AddNewTodoScreensState();
}

class _AddNewTodoScreensState extends State<AddNewTodoScreens> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
             TextFormField(
               controller: _titleTEController,
               decoration: const InputDecoration(
                 labelText: 'Title',
                 hintText: 'Title'
               ),
               autovalidateMode: AutovalidateMode.onUserInteraction,
               validator: (String? value) {
                 if(value?.trim().isEmpty ?? true){
                   return 'Enter Your Title';
                 }
                 return null;
               },
             ),
             const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _descriptionTEController,
                decoration: const InputDecoration(
                    labelText: 'Description',
                    hintText: 'Description'
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLength: 200,
                validator: (String? value) {
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter Your Description';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      Todo todo = Todo(_titleTEController.text.trim(), _descriptionTEController.text.trim(), DateTime.now());
                      widget.onAddTodo(todo);
                       Navigator.pop(context);
                    }
                  },
                  child: const Text("Add"),
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _descriptionTEController.dispose();
    _titleTEController.dispose();
  }
}
