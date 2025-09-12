// a class for login response
class LoginResponse {
  String? message;
  String? token; // Bearer Token

  LoginResponse({this.message, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['data'] = token;
    return data;
  }
}