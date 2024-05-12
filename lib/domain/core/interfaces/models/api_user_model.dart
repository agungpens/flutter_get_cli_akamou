class UserApiResponse {
  final bool isValid;
  final UserData data;
  final String token;

  UserApiResponse({
    required this.isValid,
    required this.data,
    required this.token,
  });

  factory UserApiResponse.fromJson(Map<String, dynamic> json) {
    return UserApiResponse(
      isValid: json['is_valid'] as bool,
      data: UserData.fromJson(json['data']),
      token: json['token'] as String,
    );
  }
}

class UserData {
  final int id;
  final String roleId;
  final String? prodiId;
  final String nama;
  final String username;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String passwordLama;

  UserData({
    required this.id,
    required this.roleId,
    this.prodiId,
    required this.nama,
    required this.username,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.passwordLama,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] as int,
      roleId: json['role_id'] as String,
      prodiId: json['prodi_id'] as String?,
      nama: json['nama'] as String,
      username: json['username'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'] as String)
          : null,
      passwordLama: json['password_lama'] as String,
    );
  }
}
