import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_state/model/todo_model.dart';
import 'package:riverpod_state/provider/todo_provider.dart';

class TodoPage extends ConsumerWidget {
  TodoPage({super.key});

  // Create a TextEditingController to control the input field
  final TextEditingController inputController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the todosProvider to get the list of todos
    // ignore: unused_local_variable
    final todoList = ref.watch(todosProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Todo',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            // TodoList
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Add a new todo',
                labelText: 'todo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              onFieldSubmitted: (value) {
                // Add a new todo to the list
                ref.read(todosProvider.notifier).addTodo(
                      TodoModel(
                        id: Random().nextInt(1000),
                        description: value,
                        isCompleted: false,
                      ),
                    );
                // Clear the input field
                inputController.text = "";
                // Show a snackbar to indicate that the task has been added
                showSnackBar(context);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer(
              builder: (context, ref, child) {
                final todoList = ref.watch(todosProvider);
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: todoList.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      todoList[index].description,
                      style: todoList[index].isCompleted
                          ? const TextStyle(
                              decoration: TextDecoration.lineThrough)
                          : const TextStyle(decoration: TextDecoration.none),
                    ),
                    trailing: Checkbox(
                      value: todoList[index].isCompleted,
                      // ignore: avoid_print
                      onChanged: (value) {
                        // Update the isCompleted value of the todo
                        ref
                            .read(todosProvider.notifier)
                            .toggletodo(todoList[index].id, value!);
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Function to show a snackbar
showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// SnackBar to show when a task is added
const snackBar = SnackBar(
  content: Text(
    'Task added',
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  ),
);
