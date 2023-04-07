import 'package:api_testing/models/get_users.dart';
import 'package:flutter/material.dart';

class WidgetUser extends StatelessWidget {
  const WidgetUser({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
            child: CircleAvatar(
              radius: 25,
              child: ClipOval(
                child: Image.network(
                  user.avatar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text('${user.firstName} ${user.lastName}')
        ],
      ),
    );
  }
}
