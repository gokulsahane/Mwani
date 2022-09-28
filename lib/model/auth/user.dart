import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

enum UserType { manager, employee}

// ignore: constant_identifier_names
enum MaritalStatus { Married, Single, Divorced}

@JsonSerializable(explicitToJson: true)
class AppUser extends Equatable {
  final String id;
  final String? email;
  final String? name;
  final String? userName;
  final String? avatar;
  final UserType? userType;
  final String? gender;
  final String? maritalStatus;
  final String? fcmToken;
  final DateTime? dob;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? phone;
  final String? countryCode;
  final int? nationalId;
  final int? employeeNo;

  const AppUser({
    required this.id,
    this.email,
    this.name,
    this.userName,
    this.avatar,
    this.userType,
    this.gender,
    this.maritalStatus,
    this.fcmToken,
    this.dob,
    this.createdAt,
    this.updatedAt,
    this.phone,
    this.countryCode,
    this.nationalId,
    this.employeeNo,
  });

  const AppUser.named({
    required this.id,
    this.email,
    this.name,
    this.userName,
    this.avatar,
    this.userType,
    this.gender,
    this.maritalStatus,
    this.fcmToken,
    this.dob,
    this.createdAt,
    this.updatedAt,
    this.phone,
    this.countryCode,
    this.nationalId,
    this.employeeNo,
  });

  AppUser copyWith({
    String? id,
    String? email,
    String? name,
    String? userName,
    String? avatar,
    UserType? userType,
    String? gender,
    String? maritalStatus,
    String? fcmToken,
    DateTime? dob,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? phone,
    String? countryCode,
    int? nationalId,
    int? employeeNo
  }) =>
      AppUser.named(
          id: id ?? this.id,
          email: email ?? this.email,
          name: name ?? this.name,
          userName: userName ?? this.userName,
          avatar: avatar ?? this.avatar,
          userType: userType ?? this.userType,
          gender: gender ?? this.gender,
          maritalStatus: maritalStatus ?? this.maritalStatus,
          fcmToken: fcmToken ?? this.fcmToken,
          dob: dob ?? this.dob,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt,
          phone: phone ?? this.phone,
          countryCode: countryCode ?? this.countryCode,
          nationalId: nationalId ?? this.nationalId,
          employeeNo: employeeNo ?? this.employeeNo,
      );

  factory AppUser.fromJson(json) => _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);

  @override
  List<Object?> get props => [id];
}