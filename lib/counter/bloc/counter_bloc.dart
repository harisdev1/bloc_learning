import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementEvent>((event, emit) {
      emit(const CounterState().copWith(count: state.count + 1));
    });
    on<DecrementEvent>((event, emit) {
      emit(const CounterState().copWith(count: state.count + 1));
    });
  }
}
