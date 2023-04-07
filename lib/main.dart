import 'package:api_testing/screen/get_screen.dart';
import 'package:api_testing/screen/home.dart';
import 'package:api_testing/screen/post_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/get': (context) => const GetScreen(),
        '/post': (context) => const PostScreen()
      },
    );
  }
}
