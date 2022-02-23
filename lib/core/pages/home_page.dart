import 'package:flutter/material.dart';

import '../widgets/welcome_text.dart';
import '../widgets/about_button.dart';
import '../widgets/favorites_button.dart';
import '../widgets/view_met_image.dart';
import '../widgets/view_met_text.dart';
import '../widgets/departments_list_widget.dart';
import '../widgets/search_widget.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          AboutButton(),
          FavoriteButton()
        ],
      ),
      body: SafeArea(
        top: false,
        child: Center(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  const ViewMetImage(),
                  const ViewMetText(),
                  const WelcomeText(),
                  SearchWidget(controller: _controller),
                ]
              ),
              DepartmentsListWidget()
            ],
          ),
        ),
      )
    );
  }
}
