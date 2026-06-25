class UserProfileModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String avatarUrl;
  final String birthDate;
  final String medicalNotes;

  const UserProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.avatarUrl,
    required this.birthDate,
    required this.medicalNotes,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      avatarUrl: json['avatar_url'] ?? '',
      birthDate: json['birth_date'] ?? '',
      medicalNotes: json['medical_notes'] ?? '',
    );
  }
}
