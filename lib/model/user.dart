
class User {
  User({
    required this.id,
    required this.email,
    required this.password,
    required this.fullname,
  });

  final String id;
  String email;
  String password;
  String? fullname;



  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      fullname: json['fullname'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
        'fullname': fullname,
      };
}

enum UserType { customer, control }
