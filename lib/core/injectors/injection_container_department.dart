// Injection Container for Departments

import 'package:get_it/get_it.dart';

import '../../features/departments/data/datasources/department_data_source.dart';
import '../../features/departments/data/repositories/department_repository_impl.dart';
import '../../features/departments/domain/repositories/department_repository.dart';
import '../../features/departments/presentation/bloc/department_bloc.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // bloc
  // sl.registerFactory(() => DepartmentBloc(sl())); TODO: finish this

  // repository
  sl.registerLazySingleton<DepartmentRepository>(() => DepartmentRepositoryImpl(
      dataSource: sl()
  ));

  // data source
  sl.registerLazySingleton<DepartmentDataSource>(() => DepartmentDataSourceImpl(
      client: sl()
  ));
}