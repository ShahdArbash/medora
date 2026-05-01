import 'package:bloc/bloc.dart';

import 'package:medoraapp/core/error/api_exception.dart';
import 'package:medoraapp/features/auth/data/services/auth_repository.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final AuthRepository authRepository;

  OtpCubit(this.authRepository) : super(OtpInitial());

  Future<void> verify(String email, String otp) async {
    emit(OtpLoading());

    try {
      await authRepository.verifyOtp(email: email, otp: otp);

      emit(OtpSuccess());
    } on ApiException catch (e) {
      emit(OtpError(e.userMessage));
    } catch (_) {
      emit(OtpError("Something went wrong"));
    }
  }
}
