import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:navigation_drawer_animation/screens/help_page.dart';
import 'package:navigation_drawer_animation/screens/notification_page.dart';
import 'package:navigation_drawer_animation/screens/payment_page.dart';
import 'package:navigation_drawer_animation/menupage.dart';
import 'package:navigation_drawer_animation/models/menuitem.dart';
import 'package:navigation_drawer_animation/screens/promo_page.dart';
import 'package:navigation_drawer_animation/screens/rate_us.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MenuItem currentItem = MenuItems.payment;

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.payment:
        return const PaymentPage();
      case MenuItems.promos:
        return const PromoPage();
      case MenuItems.notifications:
        return const NotificationPage();
      case MenuItems.help:
        return const HelpPage();
      case MenuItems.rateUs:
        return const RateUsPage();
      default:
        return const PaymentPage();
    }
  }

  @override
  Widget build(BuildContext context) => ZoomDrawer(
        style: DrawerStyle.Style1,
        borderRadius: 40,
        angle: -10,
        slideWidth: MediaQuery.of(context).size.width * 0.8,
        showShadow: true,
        backgroundColor: Colors.orange,
        menuScreen: Builder(
          builder: (context) => MenuPage(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() => currentItem = item);
              ZoomDrawer.of(context)!.close();
            },
          ),
        ),
        mainScreen: getScreen(),
      );
}
