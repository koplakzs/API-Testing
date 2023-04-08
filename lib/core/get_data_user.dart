import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/get_users.dart';

Future gets() async {
  String urlApi = 'https://reqres.in/api/users?page=1';
  final response = await http.get(Uri.parse(urlApi));

  print(response.statusCode);

  if (response.statusCode == 200) {
    var getUsersData = jsonDecode(response.body);
    var getUser = getUsersData['data'] as List;
    var users = getUser.map((e) => User.fromJson(e)).toList();
    var total = getUsersData['total'];
    print(users);
    print(total);
    return {
      'users': users,
      'total': total,
    };
  } else {
    throw Exception('Failed to Load Data');
  }
}
