import 'package:flutter/material.dart';

import 'genColor.dart';

class MenuNavbarAgen {
  const MenuNavbarAgen(this.title, this.icon);
  final String title;
  final IconData icon;
}

const List<MenuNavbarAgen> allDestinations = <MenuNavbarAgen>[
  MenuNavbarAgen('Property', Icons.home_outlined),
  MenuNavbarAgen('Profil', Icons.account_box_outlined),
];