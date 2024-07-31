part of 'counter_bloc.dart';

@immutable
class CounterState extends Equatable {
  final int count;

  const CounterState({this.count = 0});

  CounterState copWith({int? count}) {
    return CounterState(count: count ?? this.count);
  }

  @override
  List<Object?> get props => [count];
}
