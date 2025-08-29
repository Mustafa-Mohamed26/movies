class UpdateProfileRequest {
  final String name;
  final String phone;

  UpdateProfileRequest({
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
    };
  }
}