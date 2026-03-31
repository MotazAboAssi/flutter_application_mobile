
import 'package:bloc_project/coutner/bloc.dart';
import 'package:bloc_project/coutner/event.dart';
import 'package:bloc_project/coutner/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(create: (context) => CounterBloc(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("message");
    return Scaffold(
      appBar: AppBar(title: Text("Counter BloC")),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text("Counter : ${state.value}");
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().add(Increment()),
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () => context.read<CounterBloc>().add(Decrement()),
            icon: Icon(Icons.remove_circle),
          ),
        ],
      ),
    );
  }
}
