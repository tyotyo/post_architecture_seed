import 'package:post_architecture_seed/entities/constants.dart';

class User {
  final String? userId;
  final String? role;
  final String? serviceUserId;
  final DateTime? exp;
  final ApproveStatus? approveStatus;

  User({
    this.userId,
    this.role,
    this.serviceUserId,
    this.exp,
    this.approveStatus,
  });

  User copyWith({
    String? userId,
    String? role,
    String? serviceUserId,
    DateTime? exp,
    ApproveStatus? approveStatus,
  }) {
    return User(
      userId: userId ?? this.userId,
      role: role ?? this.role,
      serviceUserId: serviceUserId ?? this.serviceUserId,
      exp: exp ?? this.exp,
      approveStatus: approveStatus ?? this.approveStatus,
    );
  }

  static User fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      role: json['role'],
      serviceUserId: json['serviceUserId'],
      exp: json['exp'] is int
          ? DateTime.fromMillisecondsSinceEpoch(json['exp'] * 1000).toLocal()
          : null,
      approveStatus: ApproveStatusExtension.fromString(json['approveStatus']),
    );
  }
}
