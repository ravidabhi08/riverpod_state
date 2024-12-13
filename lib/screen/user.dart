import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_state/provider/users_provider.dart';
import 'package:riverpod_state/screen/todo.dart';

// This class is a ConsumerWidget that displays a list of users
class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This line watches the fetchUsersProvider and gets the users
    final users = ref.watch(fetchUsersProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('User', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(4),
        child: switch (users) {
          // If the users are loaded, display a list of users
          AsyncData(:final value) => ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: value.length,
              itemBuilder: (context, index) => ListTile(
                leading: value[index].avatar_url != null
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(value[index].avatar_url!),
                      )
                    : const Icon(Icons.person),
                title: Text(value[index].login),
              ),
            ),
          // If there is an error, display a snackbar
          AsyncError(:final error) => showSnackBar(context),
          // If the users are not loaded, display a loading indicator
          _ => const Center(
              child: CircularProgressIndicator(),
            )
        },
      ),
    );
  }
}
