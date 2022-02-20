import 'package:equatable/equatable.dart';

class Department extends Equatable {
  final String displayName;
  final int departmentId;

  const Department({
    required this.displayName,
    required this.departmentId
  });

  @override
  List<Object?> get props => [];
}