import 'package:flutter/material.dart';
import 'package:practics/models/todo.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key, required this.todos, required this.onTodoTap});

  final List<Todo> todos;
  final Function(Todo) onTodoTap;

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todos.length,
      itemBuilder: (context, index) {
        final todo = widget.todos[index];
        return ListTile(
          title: Text(
            todo.title,
            style: TextStyle(
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          ),
          onTap: () {
            widget.onTodoTap(todo);
          },
        );
      },
    );
  }
}
