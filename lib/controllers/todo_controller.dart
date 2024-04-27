import 'package:flutter_todo/model/todo.dart';
import 'package:flutter_todo/model/todo_list.dart';

enum TodoSortType { titleAcs, titleDesc, dateAcs, dateDesc }

class TodoController {
  late TodoList _todoList;
  late TodoList _doneList;

  TodoController() {
    _todoList = TodoList(todos: [
      Todo('นี่คือเสียงจากเด็กวัด'),
      Todo('แก้ animation ตอนลบ todo'),
      Todo('แก้ให้ todo เก็บใน storage จริง'),
      Todo('feat search'),
      Todo('แข็งแรงเหมือนมึงเอาเหล็กงัด',
          description:
              'a;fjklajsfdkl;jaskl;fjl;asdjfl;jakl;dfjkl;jasdfkl;jkl;ajdfkl;jakl;sdfj'),
      Todo('พูดเบา ๆ แต่ก็ไกลไปเจ็ดวัด',
          description:
              'a;fjklajsfdkl;jadk;fljakl;dfjkl;jafkl;j;aklsdfj;jaskl;fjl;asdjfl;jdafdasfsdafasdfasdfakl;dfjkl;jasdfkl;jkl;ajdfkl;jakl;sdfj'),
    ]);
    _doneList = TodoList();
  }

  int get todoListLength => _todoList.length;
  int get doneListLength => _doneList.length;

  Todo getTodo(int index) => _todoList.todos[index];

  Todo getDone(int index) => _doneList.todos[index];

  void removeTodoAt(int index) {
    final todo = _todoList.todos[index];
    _todoList.remove(todo);
  }

  void addNewTodo() {
    _todoList.add(Todo(''));
  }

  void changeToDone(int index) {
    final todo = _todoList.todos[index];
    _doneList.add(todo);
    _todoList.remove(todo);
  }

  void sortTodoList(TodoSortType sortType) {
    switch (sortType) {
      case TodoSortType.titleAcs:
        // _sortTitleAcs();
        break;
      default:
        _todoList.todos.sort((a, b) => a.title.compareTo(b.title));
    }
  }
}
