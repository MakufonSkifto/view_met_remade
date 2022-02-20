import '../entities/department.dart';

abstract class DepartmentRepository {
  Future<List<Department>> getDepartments();
}