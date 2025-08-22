// a class for login response
class LoginResponse {
  String? message;
  String? data; // Bearer Token

  LoginResponse({this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}