// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
      token: json['token'] as String,
      expire: DateTime.parse(json['expire'] as String),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'token': instance.token,
      'expire': instance.expire.toIso8601String(),
      'user': instance.user,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      fullNameRu: json['fullNameRu'] as String,
      id: (json['id'] as num).toInt(),
      firstNameRu: json['firstNameRu'] as String,
      lastNameRu: json['lastNameRu'] as String,
      middleNameRu: json['middleNameRu'] as String,
      photo: json['photo'] as String,
      globalRole: json['globalRole'] as String,
      department: json['department'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fullNameRu': instance.fullNameRu,
      'id': instance.id,
      'firstNameRu': instance.firstNameRu,
      'lastNameRu': instance.lastNameRu,
      'middleNameRu': instance.middleNameRu,
      'photo': instance.photo,
      'globalRole': instance.globalRole,
      'department': instance.department,
    };

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) => ProjectModel(
      rolesIds: json['rolesIds'] as String,
      id: (json['id'] as num).toInt(),
      projectId: (json['projectId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      authorId: (json['authorId'] as num).toInt(),
      roles: (json['roles'] as List<dynamic>)
          .map((e) => RoleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'rolesIds': instance.rolesIds,
      'id': instance.id,
      'projectId': instance.projectId,
      'userId': instance.userId,
      'authorId': instance.authorId,
      'roles': instance.roles,
    };

RoleModel _$RoleModelFromJson(Map<String, dynamic> json) => RoleModel(
      id: (json['id'] as num).toInt(),
      projectUserId: (json['projectUserId'] as num).toInt(),
      projectRoleId: (json['projectRoleId'] as num).toInt(),
    );

Map<String, dynamic> _$RoleModelToJson(RoleModel instance) => <String, dynamic>{
      'id': instance.id,
      'projectUserId': instance.projectUserId,
      'projectRoleId': instance.projectRoleId,
    };

ProjectsRolesModel _$ProjectsRolesModelFromJson(Map<String, dynamic> json) =>
    ProjectsRolesModel(
      admin: json['admin'] as List<dynamic>,
      user: (json['user'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$ProjectsRolesModelToJson(ProjectsRolesModel instance) =>
    <String, dynamic>{
      'admin': instance.admin,
      'user': instance.user,
    };
