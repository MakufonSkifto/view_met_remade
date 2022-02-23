import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:view_met_remade/view_met.dart';
import 'core/pages/home_page.dart';
import 'features/departments/presentation/bloc/department_bloc.dart';
import 'features/favorite/presentation/bloc/favorites_bloc.dart';
import 'features/piece/presentation/bloc/piece_bloc.dart';

import 'core/injectors/injection_container_piece.dart' as pc; // Piece Injection Container
import 'core/injectors/injection_container_general.dart' as gc; // General Injection Container
import 'core/injectors/injection_container_favorite.dart' as fc; // Favorites Injection Container
import 'core/injectors/injection_container_department.dart' as dc; // Departments Injection Container


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Injection Containers
  await pc.init();
  await gc.init();
  await fc.init();
  await dc.init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => pc.sl<PieceBloc>()
      ),
      BlocProvider(
        create: (context) => fc.sl<FavoritesBloc>()
      ),
      BlocProvider(
        create: (context) => dc.sl<DepartmentBloc>()
      ),
    ],
    child: ViewMet(page: HomePage()),
  ));
}
