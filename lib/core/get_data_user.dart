import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/get_users.dart';

Future gets() async {
  var urlApi = 'https://reqres.in/api/users?page=1';
  final response = await http.get(Uri.parse(urlApi));

  print(response.statusCode);

  if (response.statusCode == 200) {
    var getUsersData = jsonDecode(response.body) as Map<String, dynamic>;
    // var getUser = getUsersData['data'] as List;
    // var user = getUsersData.map((e) => User.fromJson(e)).toList();
    // print(user);
    print(getUsersData);
    return getUsersData;
  } else {
    throw Exception('Failed to Load Data');
  }
}
