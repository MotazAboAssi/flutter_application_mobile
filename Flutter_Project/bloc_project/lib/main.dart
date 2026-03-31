import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//  API
class Repository {
  final Dio dio;
  const Repository({required this.dio});

  final String api = "http://jsonplaceholder.typicode.com/posts";
  Future<List<Post>> get() async {
    try {
      final response = await dio.get(api);
      final List<dynamic> posts = response.data;
      return posts.map((post) => Post.fromJSON(post)).toList();
    } catch (error) {
      log(error.toString());
      throw Exception(error.toString());
    }
  }
}

class Post {
  final int id;
  final String title, body;

  const Post({required this.id, required this.title, required this.body});

  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(id: json["id"], title: json["title"], body: json["body"]);
  }
}

// Event
class StreamOfEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetPosts extends StreamOfEvents {}

// State
class StreamOfState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostInitial extends StreamOfState {
  final List<Post> posts = [];
  @override
  List<Object?> get props => [posts];
}

class PostLoading extends StreamOfState {}

class PostLoaded extends StreamOfState {
  final List<Post> posts;
  PostLoaded({required this.posts});
  @override
  List<Object?> get props => [posts];
}

class PostError extends StreamOfState {
  final String message;
  PostError({required this.message});
  @override
  List<Object?> get props => [message];
}

// Bloc
class StateManagement extends Bloc<StreamOfEvents, StreamOfState> {
  final Repository repository;
  StateManagement(this.repository) : super(PostInitial()) {
    on<GetPosts>((event, emit) async {
      emit(PostLoading());
      try {
        final List<Post> data = await repository.get();
        emit(PostLoaded(posts: data));
      } catch (error) {
        emit(PostError(message: error.toString()));
      }
    });
  }
}

// UI
void main() {
  runApp(
    BlocProvider(
      create: (context) => StateManagement(Repository(dio: Dio())),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<StateManagement, StreamOfState>(
            builder: (context, state) {
              if (state is PostError) {
                return Text(state.message);
              } else if (state is PostLoaded) {
                return Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        final post = state.posts[index];
                        return Text("${post.id}. ${post.title}");
                      },
                    ),
                  ),
                );
              } else if (state is PostLoading) {
                return CircularProgressIndicator();
              }
              return Text("no Data, you can requist Data .");
            },
          ),
          TextButton(
            onPressed: () {
              context.read<StateManagement>().add(GetPosts());
            },
            child: Text("GETt"),
          ),
        ],
      ),
    );
  }
}
