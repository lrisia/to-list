import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/todo/todo_card.dart';
import 'package:flutter_todo/widgets/layouts/appbar.dart';
import 'package:flutter_todo/widgets/search_bar.dart';
import 'package:flutter_todo/config/themes/theme_manager.dart';
import 'package:flutter_todo/controllers/todo_controller.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TodoController _todoController = TodoController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: buildAppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: const CustomSearchBar(
                      prefixIcon: Icons.search,
                      hintText: 'Search',
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 40, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'TODO Lists',
                        style: context.textTheme.headlineLarge,
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _todoController.addNewTodo();
                            });
                          },
                          icon: const Icon(Icons.add))
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: _todoController.todoListLength,
                        itemBuilder: (context, index) {
                          return TodoCard(
                            _todoController.getTodo(index),
                            onDelete: (context) {
                              setState(() {
                                _todoController.removeTodoAt(index);
                              });
                            },
                            onDone: (context) {
                              setState(() {
                                _todoController.changeToDone(index);
                              });
                            },
                          );
                        })),
              ],
            ),
          )),
    );
  }
}
