import 'package:medoraapp/core/storage/token_storage.dart';
import 'package:medoraapp/features/auth/data/models/login_request.dart';
import 'package:medoraapp/features/auth/data/models/login_response_model.dart';
import 'package:medoraapp/features/auth/data/models/register_request.dart';
import 'package:medoraapp/features/auth/data/models/register_response_model.dart';
import 'package:medoraapp/features/auth/data/models/verify_otp_response.dart';
import 'package:medoraapp/features/auth/data/services/auth_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository(this.authService);

  Future<RegisterResponseModel> register(RegisterRequest request) {
    return authService.register(request);
  }

  Future<VerifyOtpResponse> verifyOtp({
    required String email,
    required String otp,
  }) async {
    final response = await authService.verifyOtp(email: email, otp: otp);

    await TokenStorage.saveTokens(accessToken: response.token);

    return response;
  }

  Future<LoginResponseModel> login(LoginRequest request) async {
    final response = await authService.login(request);

    if (response.isSuccess) {
      await TokenStorage.saveTokens(accessToken: response.token);
    }

    return response;
  }

  Future<void> logout() async {
    await TokenStorage.clearAll();
  }
}
