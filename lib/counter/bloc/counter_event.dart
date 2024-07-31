part of 'counter_bloc.dart';

@immutable
//sealed class CounterEvent {}
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}
