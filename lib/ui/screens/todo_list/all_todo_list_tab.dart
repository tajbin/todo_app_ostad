import 'package:flutter/cupertino.dart';
import '../../../entities/todo.dart';
import '../../widgets/todo_item.dart';

class AllTodoListTab extends StatelessWidget {
  const AllTodoListTab(
      {super.key,
      required this.todoList,
      required this.onDelete,
      required this.onStatusChange});

  final List<Todo> todoList;
  final Function(int) onDelete;
  final Function(int) onStatusChange;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (_) {
              onDelete(index);
            },
            child: TodoItem(
              todo: todoList[index],
              onIconButtonPressed: () {
                onStatusChange(index);
              },
            ),
          );
        });
  }
}
