part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserProfileModel user;

  ProfileLoaded(this.user);
}

class ProfileUpdating extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final UserProfileModel user;

  ProfileSuccess(this.user);
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}
