import 'dart:ffi';

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
  String? name, job;
  bool? change = false;
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
          color: const Color.fromARGB(255, 165, 165, 165),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                change != false
                    ? SizedBox(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('ID : '),
                                  Text(dataPost.id == null
                                      ? "None"
                                      : '${dataPost.id}')
                                ],
                              ),
                            ),
                            SizedBox(
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Name : '),
                                    Text(dataPost.name == null
                                        ? "None"
                                        : '${dataPost.name}')
                                  ],
                                )),
                            SizedBox(
                              height: 40,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Job : '),
                                    Text(dataPost.job == null
                                        ? "None"
                                        : '${dataPost.job}')
                                  ]),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Name'),
                                const SizedBox(
                                  width: 50,
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 25,
                                  child: TextField(
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder()),
                                    onChanged: (value) {
                                      setState(() {
                                        name = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Job'),
                                const SizedBox(
                                  width: 50,
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 25,
                                  child: TextField(
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder()),
                                    onChanged: (value) {
                                      setState(() {
                                        job = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                Button(
                    onPressed: () => {
                          postData(name!, job!).then((value) {
                            // print(value);
                            dataPost.id = value['id'];
                            dataPost.job = value['job'];
                            dataPost.name = value['name'];
                            setState(() {
                              change = true;
                            });
                          })
                        },
                    text: 'Post')
              ],
            ),
          )),
    );
  }
}
