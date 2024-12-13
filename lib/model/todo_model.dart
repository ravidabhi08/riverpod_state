import 'package:freezed_annotation/freezed_annotation.dart';

// This part statement imports the generated code for the TodoModel class
part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

// This annotation tells the code generator to generate the code for the TodoModel class
@freezed
class TodoModel with _$TodoModel {
  // This factory constructor creates a new instance of the TodoModel class
  const factory TodoModel({
    // This required field represents the unique identifier for the TodoModel
    required int id,
    // This required field represents the description of the TodoModel
    required String description,
    // This required field represents whether the TodoModel is completed or not
    required bool isCompleted,
  }) = _TodoModel;

  // This factory constructor creates a new instance of the TodoModel class from a JSON object
  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);
}
