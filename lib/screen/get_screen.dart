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
  late Future user;
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
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: user,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    var users = snapshot.data!['users'] as List<User>;
                    return ListView.separated(
                        itemBuilder: ((context, index) {
                          // var datas = (snapshot.data['data'] as List<User>)[index];
                          var datas = users[index];
                          return Column(
                            children: [
                              WidgetUser(
                                  user: User(
                                      firstName: datas.firstName,
                                      lastName: datas.lastName,
                                      avatar: datas.avatar)),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        }),
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: users.length);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            SizedBox(
                height: 50,
                child: FutureBuilder(
                  future: user,
                  builder: (context, snapshot) {
                    return Text(snapshot.data?['total'].toString() ?? "");
                  },
                ))
          ],
        ),
      ),
    );
  }
}
