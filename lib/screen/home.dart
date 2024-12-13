import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_state/provider/counter_provider.dart';

// This is a class that extends ConsumerWidget, which is a widget that can consume Riverpod providers.
class HomePage extends ConsumerWidget {
  // This is a constructor that takes a key as an argument.
  const HomePage({super.key});

  // This is a method that builds the widget.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This is a Scaffold widget that contains the body and floating action button.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Increment & Decrement',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times',
            ),
            Consumer(builder: (context, ref, child) {
              final counter = ref.watch(counterProvider);
              return Text(
                counter.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              );
            }),
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).decrement();
              },
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          ref.read(counterProvider.notifier).increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
