import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penjualan_kayu/profil.dart';


import 'package:toast/toast.dart';
import 'package:provider/provider.dart';

import 'Beranda.dart';
import 'transaksi.dart';
import 'component/genColor.dart';
import 'component/genPage.dart';
import 'component/menuNavbar.dart';
import 'daftar.dart';
import 'login.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _currentIndex = 0;
  DateTime currentBackPressTime;

  // UtilBloc utilbloc;
  // NotifBloc notifbloc;

  final _widgetOptions = [
    Beranda(),
    Transaksi(),
    Profil(),
  ];

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Toast.show("Tekan sekali lagi untuk keluar aplikasi!", context);
      return "";
    }
    return SystemNavigator.pop();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      //do your stuff
      // utilbloc = Provider.of<UtilBloc>(context);
      // notifbloc = Provider.of<NotifBloc>(context);
      // utilbloc.cekProfile(context);
      // notifbloc.getCartCount();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // utilbloc = Provider.of<UtilBloc>(context);
    // notifbloc = Provider.of<NotifBloc>(context);
    // utilbloc.cekProfile(context);
    // notifbloc.getCartCount();

    return GenPage(
      // statusBarColor: GenColor.primaryColor,
      body: WillPopScope(
        child: _widgetOptions.elementAt(_currentIndex),
        onWillPop: () {
          onWillPop();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black54,
        selectedItemColor: GenColor.primaryColor,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: allDestinations.map((MenuNavbar menuNavbar) {
          return BottomNavigationBarItem(
              icon: Stack(
                children: <Widget>[
                  Center(child: Icon(menuNavbar.icon)),
                 Container()
                ],
              ),
              label: menuNavbar.title);
        }).toList(),
      ),
    );
  }
}
