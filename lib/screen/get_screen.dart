import 'package:api_testing/core/get_data_user.dart';
import 'package:api_testing/models/get_users.dart';
import 'package:api_testing/widget/button.dart';
import 'package:api_testing/widget/user.dart';
import 'package:flutter/material.dart';

class GetScreen extends StatefulWidget {
  const GetScreen({super.key});

  @override
  State<GetScreen> createState() => _GetScreenState();
}

class _GetScreenState extends State<GetScreen> {
  late Future user;
  String? page = '1';

  void _fetchData() {
    setState(() {
      user = gets(page: page!);
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
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
                    return ListView.builder(
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
                        itemCount: users.length);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Button(
                onPressed: () {
                  setState(() {
                    page == '1' ? page = '2' : page = '1';
                    _fetchData();
                  });
                },
                text: page == '1' ? "Go To Next Page" : 'Go to Previus Page'),
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
