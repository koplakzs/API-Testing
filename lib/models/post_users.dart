class PostUser {
  String? name, job, id;
  PostUser({this.name, this.job, this.id});

  factory PostUser.fromJson(Map<String, dynamic> json) {
    return PostUser(name: json['name'], job: json['job'], id: json['id']);
  }
}
