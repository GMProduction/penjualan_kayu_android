
import 'package:penjualan_kayu/DetailBarang.dart';
import 'package:penjualan_kayu/Pembayaran.dart';
import 'package:provider/provider.dart';


import 'DetailKos.dart';
import 'Keranjang.dart';
import 'base.dart';
import 'blocks/baseBloc.dart';
import 'daftar.dart';
import 'keterangan.dart';
import 'login.dart';
import 'splashScreen.dart';

class GenProvider {
  static var providers = [
    ChangeNotifierProvider<BaseBloc>.value(value: BaseBloc()),

  ];

  static routes(context) {
    return {
//           '/': (context) {
//        return Base();
//      },

      '/': (context) {
        return SplashScreen();
      },

      'splashScreen': (context) {
        return SplashScreen();
      },

      'login': (context) {
        // return Login();
        return Login();
      },



      'daftar': (context) {
        // return Login();
        return Daftar();
      },



      'base': (context) {
        // return Login();
        return Base();
      },

      'keranjang': (context) {
        // return Login();
        return Keranjang();
      },


      'keterangan': (context) {
        return Keterangan();
      },


      'detailKos': (context) {
        return DetailKos();
      },

      'detailBarang': (context) {
        return DetailBarang();
      },

      'pembayaran': (context) {
        return Permbayaran();
      },

    };
  }
}
