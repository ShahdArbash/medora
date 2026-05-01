import 'package:bloc/bloc.dart';
import 'package:medoraapp/core/error/api_exception.dart';
import 'package:medoraapp/features/auth/data/models/login_request.dart';
import 'package:medoraapp/features/auth/data/models/login_response_model.dart';
import 'package:medoraapp/features/auth/data/services/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit(this.authRepository) : super(LoginInitial());

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());

    try {
      final response = await authRepository.login(request);

      emit(LoginSuccess(response));
    } on ApiException catch (e) {
      emit(LoginError(e.userMessage));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
