import 'dart:convert';

import 'package:first_project/api/api.dart';
import 'package:http/http.dart';

class Name {
  final String firstName, lastName, id;
  const Name({
    required this.firstName,
    required this.lastName,
    required this.id,
  });
  factory Name.fromJSON(Map<String, dynamic> json) {
    return switch (json) {
      {
        "firstName": String firstName,
        "lastName": String lastName,
        "id": String id,
      } =>
        Name(firstName: firstName, lastName: lastName, id: id),
      _ => throw FormatException("Data is Invalid"),
    };
  }
}

Future<List<Name>> fetchAllData() async {
  final response = await get(Uri.parse(API));
  if (response.statusCode == 200) {
    List<dynamic> data = await jsonDecode(response.body);
    List<Name> list = data
        .map((name) => Name.fromJSON((name as Map<String, dynamic>)))
        .toList();

    return list;
  } else {
    throw Exception("Faild to load");
  }
}
