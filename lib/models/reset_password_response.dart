class ResetPasswordResponse {
  List<String>? message;
  String? error;
  int? statusCode;

  ResetPasswordResponse({this.message, this.error, this.statusCode});

  ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'].cast<String>();
    error = json['error'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['error'] = error;
    data['statusCode'] = statusCode;
    return data;
  }
}
