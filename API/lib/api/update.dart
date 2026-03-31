import 'dart:convert';

import 'package:first_project/api/api.dart';
import 'package:first_project/api/getID.dart';
import 'package:http/http.dart';

Future<Name> update(Name upda) async {
  print(upda.id);
  final response = await put(
    Uri.parse("$API/${upda.id}"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "firstName": upda.firstName,
      "lastName": upda.lastName,
      "id": upda.id,
    }),
  );
  print("object : ${response.body}");
  if (response.statusCode == 200) {
    return switch (jsonDecode(response.body) as Map<String, dynamic>) {
      {
        "firstName": String firstName,
        "lastName": String lastName,
        "id": String id,
      } =>
        Name(firstName: firstName, lastName: lastName, id: id),
      _ => throw Exception("DD"),
    };
  } else {
    throw Exception("SS");
  }
}
