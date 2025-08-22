// a class to represent the user request
class UserRequest {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? phone;
  int? avaterId;

  UserRequest(
      {this.name,
      this.email,
      this.password,
      this.confirmPassword,
      this.phone,
      this.avaterId});

  UserRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    phone = json['phone'];
    avaterId = json['avaterId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    data['phone'] = phone;
    data['avaterId'] = avaterId;
    return data;
  }
}
