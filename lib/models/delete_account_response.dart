class DeleteAccountResponse {
  final String message;

  DeleteAccountResponse({required this.message});

  factory DeleteAccountResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAccountResponse(
      message: json["message"] ?? "Account deleted successfully",
    );
  }
}



/*class DeleteAccountResponse {
  final String message;

  DeleteAccountResponse({required this.message});

  factory DeleteAccountResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAccountResponse(
      message: json["message"] ?? "",
    );
  }
}*/