import 'package:bloc_learning/counter/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState());

  void increment() {
    emit(const CounterState().copWith(count: state.count + 1));
  }

  void decrement() {
    if (state.count > 0) {
      emit(const CounterState().copWith(count: state.count - 1));
    }
  }
}
