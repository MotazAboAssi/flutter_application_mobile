import 'dart:async';
import 'dart:convert';
import 'package:first_project/api/api.dart';
import 'package:http/http.dart' as http;

Future<Name> fetchName({String id = "1"}) async {
  final response = await http.get(Uri.parse('$API/$id'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Name.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Name {
  final String firstName, lastName, id;

  const Name({
    required this.firstName,
    required this.lastName,
    required this.id,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "firstName": String firstName,
        "lastName": String lastName,
        "id": String id,
      } =>
        Name(firstName: firstName, lastName: lastName, id: id),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
