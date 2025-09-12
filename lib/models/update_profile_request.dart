class UpdateProfileRequest {
  final String avatarId;
  final String email;
  final String name;
  final String phone;

  UpdateProfileRequest({
    required this.avatarId,
    required this.email,
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      "userId": avatarId,
      "email": email,
      "name": name,
      "phone": phone,
    };
  }
}