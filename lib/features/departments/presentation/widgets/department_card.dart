import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/department.dart';
import '../pages/department_pieces_page.dart';

class DepartmentCard extends StatelessWidget {
  final Department department;

  const DepartmentCard({Key? key, required this.department}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Text(department.displayName, style: TextStyle(color: Colors.white.withOpacity(.90))),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DepartmentPiecesPage(department: department)),
                  );
                },
                child: Text("See Department", style: GoogleFonts.merriweatherSans(color: Colors.red)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}