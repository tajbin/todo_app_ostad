import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../entities/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key, required this.todo, required this.onIconButtonPressed
  });
  final Todo todo;
  final VoidCallback onIconButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      surfaceTintColor: _getCardTintColor(todo.isDone),
      color: _getBGColor(todo.isDone),
      child: ListTile(
        title: Text(todo.title, style: TextStyle(
            decoration: _getTexDecoration(todo.isDone),
           fontSize: 16,
          fontWeight: FontWeight.w600
        ),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todo.description),
            Text(DateFormat.yMEd().add_jms().format(todo.time)),
          ],
        ),
        trailing: _buildRoundedIconButton(todo.isDone),
      ),
    );
  }
  Widget _buildRoundedIconButton(bool isDone){
    return GestureDetector(
      onTap: onIconButtonPressed,
      child: CircleAvatar(
        child: Icon(_getIcon(todo.isDone)),
      ),
    );
  }
  IconData _getIcon ( bool isDone) {
    return isDone ? Icons.check : Icons.clear;
  }
  TextDecoration? _getTexDecoration( bool isDone) {
    return isDone? TextDecoration.lineThrough : null;
  }
  Color? _getCardTintColor(bool isDone){
    return isDone? Colors.green : null;
  }
  Color? _getBGColor(bool isDone){
    return isDone? Colors.green.shade100 : null;
  }
}