import 'dart:convert';

import 'package:view_met_remade/features/departments/data/models/department_model.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../domain/entities/department.dart';
import 'package:http/http.dart' as http;

abstract class DepartmentDataSource {
  Future<List<Department>> getDepartments();
}

class DepartmentDataSourceImpl extends DepartmentDataSource {
  final http.Client client;

  DepartmentDataSourceImpl({required this.client});

  @override
  Future<List<Department>> getDepartments() async {
    final response = await client.get(
      Uri.parse("$kBaseApiUrl/departments"),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Map body = json.decode(response.body);
      List<Department> departments = [];

      for (var department in body["department"]) {
        departments.add(DepartmentModel.fromJson(department));
      }

      return departments;
    } else {
      throw ServerException();
    }
  }
}

