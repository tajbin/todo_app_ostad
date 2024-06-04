import 'package:flutter/material.dart';
import 'package:todo_app_ostad/ui/screens/add_new_todo_screens.dart';
import 'package:todo_app_ostad/ui/screens/todo_list/all_todo_list_tab.dart';
import 'package:todo_app_ostad/ui/screens/todo_list/done_todo_list_tab.dart';
import 'package:todo_app_ostad/ui/screens/todo_list/undone_todo_list_tab.dart';
import '../../../entities/todo.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> _todoList = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todo List"),
          bottom: _buildTabBar(),
        ),
        body: TabBarView(
          children: [
            AllTodoListTab(
              todoList: _todoList,
              onDelete: _deleteTodo,
              onStatusChange: _toggleTodoStatus,
            ),
            DoneTodoListTab(
              todoList: _todoList.where((item) => item.isDone == true).toList(),
              onDelete: _deleteTodo,
              onStatusChange: _toggleTodoStatus,
            ),
            UndoneTodoListTab(
              todoList: _todoList.where((item) => item.isDone == false).toList(),
              onDelete: _deleteTodo,
              onStatusChange: _toggleTodoStatus,
            ),
          ],
        ),
        floatingActionButton: _buildAddTodoFB(),
      ),
    );
  }

  FloatingActionButton _buildAddTodoFB() {
    return FloatingActionButton.extended(
      tooltip: 'Add New Todo',
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddNewTodoScreens(
                      onAddTodo: _addNewTodo,
                    )));
      },
      label: const Text("Add"),
      icon: const Icon(Icons.add),
    );
  }

  TabBar _buildTabBar() {
    return const TabBar(
      tabs: [
        Tab(
          text: 'All',
        ),
        Tab(
          text: 'Done',
        ),
        Tab(
          text: 'Undone',
        )
      ],
    );
  }

  void _addNewTodo(Todo todo) {
    _todoList.add(todo);
    if (mounted) {
      setState(() {});
    }
  }

  void _deleteTodo(int index) {
    _todoList.removeAt(index);
    if (mounted) {
      setState(() {});
    }
  }

  void _toggleTodoStatus(int index) {
    _todoList[index].isDone = !_todoList[index].isDone;
    if (mounted) {
      setState(() {});
    }
  }
}
