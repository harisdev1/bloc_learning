import 'package:bloc_learning/counter/cubit/counter_cubit.dart';
import 'package:bloc_learning/counter/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.black;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Counter Bloc example "),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocListener<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state.count == 0) {
              textColor = Colors.red;
            } else {
              textColor = Colors.yellow;
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<CounterCubit, CounterState>(
                  buildWhen: (previous, current) {
                return current.count >= 0;
              }, listenWhen: (previous, current) {
                return previous.count > 0;
              }, listener: (BuildContext context, CounterState state) {
                if (state.count == 0) {
                  final snackBar = SnackBar(
                    content: const Text('Counter reset to zero'),
                    action: SnackBarAction(
                      label: 'Dismiss',
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }, builder: (BuildContext context, CounterState state) {
                print("Build");
                return Text(
                  '${state.count}',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: textColor,
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
      ),
    );
  }
}
