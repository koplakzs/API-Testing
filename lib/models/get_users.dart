class User {
  String firstName, lastName, avatar;

  User({required this.firstName, required this.lastName, required this.avatar});

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
        firstName: data['first_name'],
        lastName: data['last_name'],
        avatar: data['avatar']);
  }
}
