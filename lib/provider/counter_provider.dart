import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

// Create a Riverpod provider for a counter
@riverpod
class Counter extends _$Counter {
  // Override the build method to return an initial value of 0
  @override
  int build() => 0;

  // Create a method to increment the counter
  void increment() => state++;

  // Create a method to decrement the counter
  void decrement() => state--;
}
