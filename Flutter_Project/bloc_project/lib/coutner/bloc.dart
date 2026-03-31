import 'package:bloc_project/coutner/event.dart';
import 'package:bloc_project/coutner/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(value: 0)) {
    on<Increment>((event, emit) => emit(CounterState(value: state.value + 1)));
    on<Decrement>((event, emit) => emit(CounterState(value: state.value - 1)));
  }
}
