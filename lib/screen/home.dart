import 'package:api_testing/widget/button.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 219, 219, 218),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Button(
                onPressed: () => Navigator.pushNamed(context, '/get'),
                text: "GET API"),
            Button(
                onPressed: () => Navigator.pushNamed(context, '/post'),
                text: "Post API")
          ]),
        ),
      ),
    );
  }
}
