import 'package:bloc_learning/counter/cubit/counter_cubit.dart';
import 'package:bloc_learning/counter/pages/counter_bloc_page.dart';
import 'package:bloc_learning/counter/pages/counter_cubit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterCubit(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        // home: const CounterCubitPage(),
        home: const CounterBlocPage(),
      ),
    );
  }
}
