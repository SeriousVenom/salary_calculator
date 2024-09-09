import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  final String token;
  final DateTime expire;
  final UserModel user;

  AuthModel({
    required this.token,
    required this.expire,
    required this.user,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}

@JsonSerializable()
class UserModel {
  final String fullNameRu;
  final int id;
  final String firstNameRu;
  final String lastNameRu;
  final String middleNameRu;
  final String photo;
  final String globalRole;
  final String department;

  UserModel({
    required this.fullNameRu,
    required this.id,
    required this.firstNameRu,
    required this.lastNameRu,
    required this.middleNameRu,
    required this.photo,
    required this.globalRole,
    required this.department,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class ProjectModel {
  final String rolesIds;
  final int id;
  final int projectId;
  final int userId;
  final int authorId;
  final List<RoleModel> roles;

  ProjectModel({
    required this.rolesIds,
    required this.id,
    required this.projectId,
    required this.userId,
    required this.authorId,
    required this.roles,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
}

@JsonSerializable()
class RoleModel {
  final int id;
  final int projectUserId;
  final int projectRoleId;

  RoleModel({
    required this.id,
    required this.projectUserId,
    required this.projectRoleId,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) => _$RoleModelFromJson(json);
  Map<String, dynamic> toJson() => _$RoleModelToJson(this);
}

@JsonSerializable()
class ProjectsRolesModel {
  final List<dynamic> admin;
  final List<int> user;

  ProjectsRolesModel({
    required this.admin,
    required this.user,
  });

  factory ProjectsRolesModel.fromJson(Map<String, dynamic> json) => _$ProjectsRolesModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectsRolesModelToJson(this);
}
