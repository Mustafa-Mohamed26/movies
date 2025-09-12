class UpdateProfileResponse {
  final String message;
  final bool success;

  UpdateProfileResponse({
    required this.message,
    required this.success,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponse(
      message: json["message"] ?? "Profile updated successfully",
      success: json["success"] ?? true,
    );
  }
}