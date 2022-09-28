// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
      id: json['id'] as String,
      email: json['email'] as String?,
      name: json['name'] as String?,
      userName: json['userName'] as String?,
      avatar: json['avatar'] as String?,
      userType: $enumDecodeNullable(_$UserTypeEnumMap, json['userType']),
      gender: json['gender'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      fcmToken: json['fcmToken'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      phone: json['phone'] as String?,
      countryCode: json['countryCode'] as String?,
      nationalId: json['nationalId'] as int?,
      employeeNo: json['employeeNo'] as int?,
    );

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'userName': instance.userName,
      'avatar': instance.avatar,
      'userType': _$UserTypeEnumMap[instance.userType],
      'gender': instance.gender,
      'maritalStatus': instance.maritalStatus,
      'fcmToken': instance.fcmToken,
      'dob': instance.dob?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'phone': instance.phone,
      'countryCode': instance.countryCode,
      'nationalId': instance.nationalId,
      'employeeNo': instance.employeeNo,
    };

const _$UserTypeEnumMap = {
  UserType.manager: 'manager',
  UserType.employee: 'employee',
};
