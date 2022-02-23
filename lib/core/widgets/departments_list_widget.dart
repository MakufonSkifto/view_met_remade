import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:view_met_remade/features/departments/presentation/pages/departments_list.dart';

class DepartmentsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Column(
        children: <Widget>[
          Text("Departments", style: GoogleFonts.merriweatherSans(fontSize: 18, color: Colors.white.withOpacity(.90))),
          Scrollbar(
            child: SizedBox(
                height: MediaQuery.of(context).size.height - 438,
                child: const DepartmentsList()
            ),
          ),
        ],
      ),
    );
  }
}
