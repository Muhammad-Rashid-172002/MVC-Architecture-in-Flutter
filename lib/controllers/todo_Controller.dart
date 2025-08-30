import 'package:practics/models/todo.dart';

class TodoController {
  List<Todo> todos = [];

  void addTodo(String title) {
    todos.add(Todo(title: title));
  }

  void toggleTodoStatus(Todo todo) {
    todo.toggleDone();
  }

  void removeTodo(Todo todo) {
    todos.remove(todo);
  }
}
