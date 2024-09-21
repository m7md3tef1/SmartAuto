import 'User.dart';

class Register {
  Register({
    this.user,
    this.token,
  });

  Register.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user!.toJson();
    }
    map['token'] = token;
    return map;
  }
}
