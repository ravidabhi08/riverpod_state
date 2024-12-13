import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_state/model/todo_model.dart';

part 'todo_provider.g.dart';

@riverpod
class Todos extends _$Todos {
  // This is the build method that is called when the provider is created.
  @override
  List<TodoModel> build() {
    // This returns an empty list of TodoModels.
    return [];
  }

  // This method adds a new TodoModel to the list of TodoModels.
  void addTodo(TodoModel todo) {
    // This sets the state to a new list that includes the new TodoModel and all the existing TodoModels.
    state = [todo, ...state];
  }

  void toggletodo(int id, bool isCompleted) {
    state = state.map((todo) {
      if (todo.id == id) {
        // This returns a new TodoModel with the isCompleted property set to the new value.
        return todo.copyWith(isCompleted: isCompleted);
      }
      // This returns the original TodoModel if the id does not match.
      return todo;
    }).toList();
  }
}
