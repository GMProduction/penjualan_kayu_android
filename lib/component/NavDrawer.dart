import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'genDimen.dart';
import 'genPreferrence.dart';
import 'menuDrawer.dart';

class NavDrawer extends StatelessWidget {

  keluar(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
        });
  }

  logout(context) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushNamed(context, "splashScreen");
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.all(GenDimen.sidePadding),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                child: Icon(
                  Icons.close,
                  color: Colors.black87,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MenuDrawer(title: "Profil", ontap: (){Navigator.pushNamed(context, "profil");},),

            MenuDrawer(
              title: "Keluar",
              ontap: () {
                 deleteAllPref();
                Navigator.pushReplacementNamed(context, "login");

              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
