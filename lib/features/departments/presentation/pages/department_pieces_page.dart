import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../favorite/presentation/widgets/loading_widget.dart';
import '../../../departments/presentation/widgets/message_display.dart';
import '../../domain/entities/department.dart';
import '../bloc/department_bloc.dart';
import '../../../../core/injectors/injection_container_department.dart';
import '../widgets/department_pieces_display.dart';

class DepartmentPiecesList extends StatelessWidget {
  final Department department;

  const DepartmentPiecesList({Key? key, required this.department}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  BlocProvider<DepartmentBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<DepartmentBloc>()..add(OnDepartmentPiecesRequestedEvent(department: department)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<DepartmentBloc, DepartmentState>(
            builder: (context, state) {
              if (state is Loading) {
                return const LoadingWidget();
              } else if (state is LoadedPieces) {
                return DepartmentPiecesDisplay(pieces: state.pieces);
              } else if (state is Error) {
                return MessageDisplay(
                  message: state.message,
                );
              } else {
                return const LoadingWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}