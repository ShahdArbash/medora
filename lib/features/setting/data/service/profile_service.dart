import 'package:medoraapp/core/network/api_client.dart';
import 'package:medoraapp/features/setting/data/model/user_profile_model.dart';

class ProfileService {
  final ApiClient apiClient;

  ProfileService(this.apiClient);

  Future<UserProfileModel> getProfile() async {
    final response = await apiClient.client.get("/patient/profile");

    return UserProfileModel.fromJson(response.data["data"]);
  }

  Future<UserProfileModel> updateProfile(UserProfileModel user) async {
    final response = await apiClient.client.put(
      "/patient/profile/${user.id}",
      data: {
        "name": user.name,
        "email": user.email,
        "phone": user.phone,
        "gender": user.gender,
      },
    );

    return UserProfileModel.fromJson(response.data["data"]);
  }
}
