import 'package:view_met_remade/features/departments/domain/entities/department.dart';
import 'package:view_met_remade/features/departments/domain/repositories/department_repository.dart';

import '../datasources/department_data_source.dart';

class DepartmentRepositoryImpl extends DepartmentRepository {
  final DepartmentDataSource dataSource;

  DepartmentRepositoryImpl({
    required this.dataSource
  });

  @override
  Future<List<Department>> getDepartments() {
    return dataSource.getDepartments();
  }
}