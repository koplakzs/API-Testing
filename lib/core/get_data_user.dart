import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/get_users.dart';

Future<List<User>> gets() async {
  var urlApi = 'https://reqres.in/api/users?page=1';
  final response = await http.get(Uri.parse(urlApi));

  print(response.statusCode);

  if (response.statusCode == 200) {
    var getUsersData = jsonDecode(response.body);
    print(getUsersData);
    var getUser = getUsersData['data'] as List;
    var user = getUser.map((e) => User.fromJson(e)).toList();

    return user;
  } else {
    throw Exception('Failed to Load Data');
  }
}
