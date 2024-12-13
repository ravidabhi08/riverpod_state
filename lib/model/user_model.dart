import 'package:freezed_annotation/freezed_annotation.dart';

// This part statement imports the generated code for the UserModel class
part 'user_model.freezed.dart';
part 'user_model.g.dart';

// This annotation tells the code generator to generate the boilerplate code for the UserModel class
@freezed
class UserModel with _$UserModel {
  // This factory constructor creates a new instance of the UserModel class
  const factory UserModel({
    // This required field represents the id of the user
    required int  id,
    // This required field represents the login name of the user
    required String login,
    // This required field represents the node id of the user
    // ignore: non_constant_identifier_names
    required String node_id,
     // ignore: non_constant_identifier_names
     String? avatar_url,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
