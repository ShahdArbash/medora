class VerifyOtpResponse {
  final String token;
  final String type;

  VerifyOtpResponse({required this.token, required this.type});

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};

    return VerifyOtpResponse(
      token: data['token'] ?? '',
      type: data['type'] ?? '',
    );
  }
}
