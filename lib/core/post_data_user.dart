import 'dart:convert';

import 'package:api_testing/models/post_users.dart';
import 'package:http/http.dart' as http;

Future postData(String name, String job) async {
  String apiUrl = 'https://reqres.in/api/users';
  final response =
      await http.post(Uri.parse(apiUrl), body: {'name': name, 'job': job});
  if (response.statusCode == 201) {
    var postUserData = json.decode(response.body);
    // var users = postUserData.map((e) => PostUser.fromJson(e)).toList();

    // print(users);
    return postUserData;
  } else {
    throw Exception('Failed to Post Data');
  }
}
