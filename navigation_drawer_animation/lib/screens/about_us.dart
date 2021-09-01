import 'package:flutter/material.dart';
import 'package:navigation_drawer_animation/menuwidget.dart';

class AvoutUsPage extends StatelessWidget {
  const AvoutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: MenuWidget(),
          title: const Text('Avout Us'),
        ),
      );
}
