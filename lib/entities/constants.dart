import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

enum ApproveStatus {
  approve,
  wait,
  reject,
}

extension ApproveStatusExtension on ApproveStatus {
  static ApproveStatus? fromString(String value) {
    return ApproveStatus.values
        .firstWhereOrNull((element) => describeEnum(element) == value);
  }
}
