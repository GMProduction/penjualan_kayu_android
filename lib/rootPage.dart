// ignore_for_file: file_names

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'blocks/baseBloc.dart';
import 'routes.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final navigatorKey = GlobalKey<NavigatorState>();


  @override
  void initState() {

    super.initState();
//    Pembayaran_diterima
//    Pembayaran_ditolak
//     _firebaseMessaging.configure(
//       onMessage: (Map<String, dynamic> message) async {
//         unNavigateNotification(message);
//       },
//       onLaunch: (Map<String, dynamic> message) async {
// //          setPrefferenceBool('noNavigate', true);
//         navigate(message);
//       },
//       onResume: (Map<String, dynamic> message) async {
//         getMessage(message);
// //          navigate(message);
//       },
//     );


  }

   BaseBloc bloc;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget),
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(450, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
            background: Container(color: Color(0xFFF5F5F5))),
        theme: ThemeData(fontFamily: 'Nunito'),
        initialRoute: 'splashScreen',
        routes: GenProvider.routes(context),
        debugShowCheckedModeBanner: false,
      ),
      providers: GenProvider.providers,
      builder: (context, widget) {
        bloc = Provider.of<BaseBloc>(context);
        return widget;
      },
    );
  }

  Future onSelectNotification(String pld) async {
    Map<dynamic, dynamic> payload = json.decode(pld);
    dynamic msgData = payload['data'];
//
//    if (msgData['type'] == "inbox") {
//      navigatorKey.currentState.pushNamed(ChatRoomState.routeName,
//          arguments: ChatRoom(
//            idDocument: msgData['pid'],
//            productName: msgData['pName'],
//          ));
//    }

//    if (msgData['type'] == 'Pesanan') {
//    GenCustomAlert(
//        navigatorKey.currentState.overlay.context, msgData['data']['body'],
////        img: 'assets/images/icons/logotok.png',
//        isi: msgData['data']['msg'],
//        height: 300.h,
//        body: Container(
//            margin: EdgeInsets.only(bottom: 20.h),
//            width: 300.w,
//            child: GenButton(
//              text: "Lihat",
//              iconRight: Icons.chevron_right,
//              ontap: () {
//                navigatorKey.currentState.pop();
//                msgData["data"]["type"] == "Pesanan"
//                    ? navigatorKey.currentState.pushNamed("tagihan")
//                    : msgData["data"]["type"] == "Konfirmasi"
//                        ? navigatorKey.currentState.pushNamed('vcall',
//                            arguments: CallScreen(
//                                peerId: msgData["data"]["clientId"]
//                            ))
//                        : navigatorKey.currentState.pop(context);
//              },
//            )));
  }

//  }

}
