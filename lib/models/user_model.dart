
class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? role;

  UserModel({
    this.id, this.name, this.email, this.password,  this.role,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? null;
    name = json['name'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (name != null) {
      data['name'] = name;
    }
    if (role != null) {
      data['role'] = role;
    }
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }


}