// ignore_for_file: file_names, prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:flutter/material.dart';

import 'component/genColor.dart';
import 'component/genPreferrence.dart';
import 'component/request.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  var opacity = 0.0;
  String buildNumber = "";
  var dataUser;
  final req = new GenRequest();

  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  cekLogin() async {
    var log = await getPrefferenceToken();

    print("lognya $log");
    var _duration = Duration(milliseconds: 2000);
    return Timer(_duration, () {
      log == "belumlogin"
          ? Navigator.pushReplacementNamed(context, "login")
          : Navigator.pushReplacementNamed(context, "base");
    });
  }

  startSplashScreen() {
    print("checklogin");
    cekLogin();
  }

  startAnim() {
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      startAnim();
      startSplashScreen();
      loaded = true;
    }

    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.jpeg',
                width: 200,
                fit: BoxFit.fitWidth,
              ),
              // AnimatedOpacity(
              //   curve: Curves.easeIn,
              //   duration: Duration(milliseconds: 1000),
              //   opacity: opacity,
              //   child:
              //
              // ),
              SizedBox(
                height: 20,
              ),
              // Text(
              //   "Pengurusan Surat",
              //   style: TextStyle(color: GenColor.primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
              // )
            ],
          ),
        ),
      ),
    );
  }

}
