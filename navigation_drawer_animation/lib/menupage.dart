import 'package:flutter/material.dart';
import 'package:navigation_drawer_animation/menuwidget.dart';
import 'package:navigation_drawer_animation/models/menuitem.dart';

class MenuPage extends StatelessWidget {
  const MenuPage(
      {Key? key, required this.currentItem, required this.onSelectedItem})
      : super(key: key);
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  Widget buildMenuItem(MenuItem item) => ListTileTheme(
        selectedColor: Colors.white,
        child: ListTile(
          selected: currentItem == item,
          selectedTileColor: Colors.black26,
          minLeadingWidth: 20,
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () => onSelectedItem(item),
        ),
      );

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData.dark(),
        child: Scaffold(
          backgroundColor: Colors.indigo,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                ...MenuItems.all.map(buildMenuItem).toList(),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      );
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

class MenuItems {
  static const payment = MenuItem('Payment', Icons.payment);
  static const promos = MenuItem('Promo', Icons.card_giftcard);
  static const notifications = MenuItem('Notifications', Icons.notifications);
  static const help = MenuItem('Help', Icons.help);
  static const aboutUs = MenuItem('About Us', Icons.info_outline);
  static const rateUs = MenuItem('Rate Us', Icons.star_border_outlined);

  static const all = <MenuItem>[
    payment,
    promos,
    notifications,
    help,
    aboutUs,
    rateUs,
  ];
}
