class UpdateProfileResponse {
  final String message;

  UpdateProfileResponse({required this.message});

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponse(
      message: json["message"] ?? "",
    );
  }
}