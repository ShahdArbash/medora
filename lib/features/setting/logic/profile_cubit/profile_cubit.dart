import 'package:bloc/bloc.dart';
import 'package:medoraapp/core/error/api_exception.dart';
import 'package:medoraapp/features/setting/data/model/user_profile_model.dart';
import 'package:medoraapp/features/setting/data/service/profile_service.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileService service;

  ProfileCubit(this.service) : super(ProfileInitial());

  UserProfileModel? _editableUser;

  /// تحميل البيانات
  Future<void> getProfile() async {
    emit(ProfileLoading());

    try {
      final user = await service.getProfile();

      _editableUser = user;

      emit(ProfileLoaded(user));
    } on ApiException catch (e) {
      emit(ProfileError(e.userMessage));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  /// تعديل محلي (بدون API)
  void updateLocal(UserProfileModel user) {
    _editableUser = user;
    emit(ProfileLoaded(user)); // ممتاز
  }

  /// حفظ التعديلات
  Future<void> updateProfile() async {
    if (_editableUser == null) return;

    emit(ProfileUpdating());

    try {
      final updated = await service.updateProfile(_editableUser!);

      _editableUser = updated;

      emit(ProfileSuccess(updated));
    } on ApiException catch (e) {
      emit(ProfileError(e.userMessage));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
