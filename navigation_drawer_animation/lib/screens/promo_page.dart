import 'package:flutter/material.dart';
import 'package:navigation_drawer_animation/menuwidget.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: MenuWidget(),
          title: const Text('Promo'),
        ),
      );
}
