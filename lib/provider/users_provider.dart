import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_state/model/user_model.dart';
import 'package:dio/dio.dart';

part 'users_provider.g.dart';

final dio = Dio();

@riverpod
// ignore: deprecated_member_use_from_same_package
Future<List<UserModel>> fetchUsers(FetchUsersRef ref) async {
  // Make a GET request to the GitHub API to fetch a list of users
  var response = await dio.get("https://api.github.com/users");
  // Create a list of UserModel objects from the response data
  List<UserModel> users = [
    for (var item in response.data) UserModel.fromJson(item)
  ];

  // Return the list of users
  return users;
}
