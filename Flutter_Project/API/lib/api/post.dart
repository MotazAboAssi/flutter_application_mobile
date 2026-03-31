import 'dart:convert';

import 'package:first_project/api/api.dart';
import 'package:http/http.dart';

class PostName {
  final String firstName, lastName;

  const PostName({
    required this.firstName,
    required this.lastName,
  
  });

  factory PostName.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "firstName": String firstName,
        "lastName": String lastName,
        
      } =>
        PostName(firstName: firstName, lastName: lastName),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

Future<PostName> postName(PostName name) async {
  final response = await post(
    Uri.parse(API),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "firstName": name.firstName,
      "lastName": name.lastName,
    }),
  );

  if (response.statusCode == 201) {
    return name;
  } else {
    throw Exception("Data is invaled");
  }
}
