import 'dart:convert';

import 'package:first_project/api/api.dart';
import 'package:first_project/api/get.dart';
import 'package:http/http.dart';

Future<Name> deleteName(int id) async {
  print("inside");
  final response = await delete(
    Uri.parse("$API/$id"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print("success");
    print("data : ${jsonDecode(response.body)}");
    return switch (jsonDecode(response.body) as Map<String, dynamic>) {
      {
        "firstName": String firstName,
        "lastName": String lastName,
        "id": String id,
      } =>
        Name(firstName: firstName, lastName: lastName, id: id),
      _ => throw Exception(""),
    };
  } else {
    return throw Exception("");
  }
}
