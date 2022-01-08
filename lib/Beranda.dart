// ignore: file_names
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:penjualan_kayu/DetailBarang.dart';
import 'package:provider/provider.dart';

import 'DetailKos.dart';
import 'blocks/baseBloc.dart';
import 'component/JustHelper.dart';
import 'component/NavDrawer.dart';
import 'component/TextFieldLogin.dart';
import 'component/commonPadding.dart';
import 'component/genButton.dart';
import 'component/genColor.dart';
import 'component/genDimen.dart';
import 'component/genRadioMini.dart';
import 'component/genShadow.dart';
import 'component/genText.dart';
import 'component/request.dart';
import 'component/textAndTitle.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> with WidgetsBindingObserver {
  final req = new GenRequest();

//  VARIABEL

  bool loading = false;

  // NotifBloc notifbloc;
  bool isLoaded = false;

//  double currentgurulainValue = 0;
  PageController gurulainController = PageController();
  var stateMetodBelajar = 1;
  var bloc, dataBarang;
  var clientId;
  var stateHari;
  var dariValue, keValue, totalpenumpang;
  dynamic dataUser;

  @override
  void initState() {
    // TODO: implement initState
    // analytics.
    getUser();
    getBarang();

    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  String clienId;

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);

    // notifbloc.dispose();
    // bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: GenColor.primaryColor, // status bar color
    ));

    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    bloc = Provider.of<BaseBloc>(context);
    // notifbloc = Provider.of<NotifBloc>(context);

    // sendAnalyticsEvent(testLogAnalytic);
    // print("anal itik "+testLogAnalytic);

    if (!isLoaded) {
      isLoaded = true;
    }

    // notifbloc.getTotalNotif();

    // bloc.util.getActiveOnline();
    // bloc.util.getNotifReview();

    // bloc.util.getRekomendasiAll("district", "level", 1, "limit", "offset");

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: GenColor.primaryColor,
        elevation: 0,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, "notifikasi", arguments: );
                },
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "keranjang");
                      },
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 26.0,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: GenColor.primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GenText(
                    dataUser == null ? "" : "Hai " + "Bambang" + ",",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextLoginField(
                    label: "Apa yang kamu cari ?",
                    labelColor: Colors.white,
                  )
                ],
              ),
            ),
            Expanded(
              child: dataBarang == null
                  ? Container()
                  : dataBarang.length == 0
                      ? Center(
                          child: GenText("Tidak ada mobil tersedia"),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              CommonPadding(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: dataBarang["payload"]
                                          .map<Widget>((e) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, "detailBarang",
                                                arguments: DetailBarang(
                                                  id: e["id"],
                                                ));
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            margin: EdgeInsets.only(bottom: 20),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                boxShadow: GenShadow()
                                                    .genShadow(
                                                        radius: 3.w,
                                                        offset:
                                                            Offset(0, 2.w))),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Image.network(
                                                  ip + e["gambar"],
                                                  height: 150,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                CommonPadding(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      GenText(
                                                        e["nama"],
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      GenText(
                                                          formatRupiahUseprefik(e["harga"])+ " /" + e["satuan"]),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList())),
                            ],
                          ),
                        ),
            )
          ],
        ),
      ),
    );
  }

  void getUser() async {
    print("data usernya :");
    dataUser = await req.getApi("user");

    print(dataUser);
    setState(() {});
  }

  void getBarang() async {
    print("GET Barang $dataBarang");

    dataBarang = await req.getApi("barang");

    print("DATA Barang $dataBarang");

    setState(() {});
  }
}
