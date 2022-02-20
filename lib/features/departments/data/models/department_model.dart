import 'package:view_met_remade/features/departments/domain/entities/department.dart';

class DepartmentModel extends Department {
  const DepartmentModel({
    required String displayName,
    required List<int> departmentId
  }) : super(
      displayName: displayName,
      departmentId: departmentId
  );

  factory DepartmentModel.fromJson(Map<String, dynamic> data) {
    return DepartmentModel(
      displayName: data["displayName"],
      departmentId: data["departmentId"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "displayName": displayName,
      "departmentId": departmentId
    };
  }
}