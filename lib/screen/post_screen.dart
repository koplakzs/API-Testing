import 'package:api_testing/core/post_data_user.dart';
import 'package:api_testing/models/post_users.dart';
import 'package:api_testing/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  PostUser dataPost = PostUser();
  // late Future PostUser(String name, String job);

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setState(() {
  //     PostUser() = post(name, job)
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: const Color.fromARGB(255, 60, 212, 18),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('ID : '),
                      Text(dataPost.id == null ? "None" : '${dataPost.id}')
                    ],
                  ),
                ),
                SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Name : '),
                        Text(
                            dataPost.name == null ? "None" : '${dataPost.name}')
                      ],
                    )),
                SizedBox(
                  height: 40,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Job : '),
                        Text(dataPost.job == null ? "None" : '${dataPost.job}')
                      ]),
                ),
                Button(
                    onPressed: () => {
                          postData('Ridho Alfandi', 'Flutter Dev')
                              .then((value) {
                            // print(value);
                            dataPost.id = value['id'];
                            dataPost.job = value['job'];
                            dataPost.name = value['name'];
                            setState(() {});
                          })
                        },
                    text: 'Post')
              ],
            ),
          )),
    );
  }
}
