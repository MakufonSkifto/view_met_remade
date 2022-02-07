import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:view_met_remade/features/piece/presentation/pages/piece_page.dart';
import 'package:view_met_remade/view_met.dart';
import 'features/piece/presentation/bloc/piece_bloc.dart';
import 'core/injectors/injection_container_piece.dart' as pc; // Piece Injection Container
import 'core/injectors/injection_container_general.dart' as gc; // General Injection Container


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Injection Containers
  await pc.init();
  await gc.init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => pc.sl<PieceBloc>()
      )
    ],
    child: const ViewMet(page: PiecePage(id: 31)),
  ));
}
