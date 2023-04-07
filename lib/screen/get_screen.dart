import 'package:api_testing/core/get_data_user.dart';
import 'package:api_testing/models/get_users.dart';
import 'package:api_testing/widget/user.dart';
import 'package:flutter/material.dart';

class GetScreen extends StatefulWidget {
  const GetScreen({super.key});

  @override
  State<GetScreen> createState() => _GetScreenState();
}

class _GetScreenState extends State<GetScreen> {
  late Future<List<User>> user;

  @override
  void initState() {
    super.initState();
    setState(() {
      user = gets();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 219, 219, 218),
        child: FutureBuilder(
          future: user,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return ListView.separated(
                  itemBuilder: ((context, index) {
                    var users = (snapshot.data as List<User>)[index];
                    return Column(
                      children: [
                        WidgetUser(
                            user: User(
                                firstName: users.firstName,
                                lastName: users.lastName,
                                avatar: users.avatar)),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  }),
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: (snapshot.data as List<User>).length);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
