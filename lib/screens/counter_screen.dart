import 'package:eriks_example_project/cubits/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CounterButtons(),
    );
  }
}

class CounterButtons extends StatelessWidget {
  const CounterButtons({super.key});

  void _incrementCounter(BuildContext context) {
    context.read<CounterCubit>().increment();
  }

  void _decrementCounter(BuildContext context) {
    context.read<CounterCubit>().decrement();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () => _decrementCounter(context),
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 8),
        FloatingActionButton(
          onPressed: () => _incrementCounter(context),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
