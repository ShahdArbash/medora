import 'package:medoraapp/features/auth/data/models/user_model.dart';

class LoginResponseModel {
  final String status;
  final String message;
  final UserModel user;
  final String token;
  final String? tokenType;

  LoginResponseModel({
    required this.status,
    required this.message,
    required this.user,
    required this.token,
    this.tokenType,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? {};
    final userJson = data['user'] as Map<String, dynamic>? ?? {};
    final authJson = data['authorisation'] as Map<String, dynamic>? ?? {};

    return LoginResponseModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      user: UserModel.fromJson(userJson),
      token: authJson['token'] ?? '',
      tokenType: authJson['type'] ?? 'bearer',
    );
  }

  bool get isSuccess => status == 'success';
}
