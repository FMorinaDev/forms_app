part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

class CounterIncreased extends CounterEvent{
  final int valor;

  const CounterIncreased(this.valor);
  
}
class Refresh extends CounterEvent{
  Refresh();
}