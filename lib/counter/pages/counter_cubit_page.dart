import 'package:bloc_learning/counter/cubit/counter_cubit.dart';
import 'package:bloc_learning/counter/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitPage extends StatelessWidget {
  const CounterCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Counter Cubit example "),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
                buildWhen: (previous, current) {
              return current.count >= 0;
            }, builder: (BuildContext context, CounterState state) {
              print("Build");
              return Text(
                '${state.count}',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                    },
                    child: const Text("Increment"),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().decrement();
                    },
                    child: const Text("Decrement"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
