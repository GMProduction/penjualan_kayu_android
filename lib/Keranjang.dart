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

class Keranjang extends StatefulWidget {
  @override
  _KeranjangState createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> with WidgetsBindingObserver {
  final req = new GenRequest();

//  VARIABEL

  bool loading = false;

  // NotifBloc notifbloc;
  bool isLoaded = false;

//  double currentgurulainValue = 0;
  PageController gurulainController = PageController();
  var stateMetodBelajar = 1;
  var bloc, dataKeranjang;
  var clientId;
  var stateHari;
  var dariValue, keValue, totalpenumpang;
  dynamic dataUser;
  dynamic dataKota;
  Map checkboxs = {};
  Map<int, bool> dataCheckBoxs = {};
  int total = 0;
  Map kotaTujuan = {};
  var dataOngkir;
  var alamat = "";

  @override
  void initState() {
    // TODO: implement initState
    // analytics.
    getUser();
    getProperty();
    getKotaOngkir();

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
            maxWidth: MediaQuery
                .of(context)
                .size
                .width,
            maxHeight: MediaQuery
                .of(context)
                .size
                .height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    bloc = Provider.of<BaseBloc>(context);
    // notifbloc = Provider.of<NotifBloc>(context);

    // sendAnalyticsEvent(testLogAnalytic);
    // print("anal itik "+testLogAnalytic);

    if (!isLoaded) {
      isLoaded = true;
    }

    checkboxs = dataCheckBoxs;
    hitungTotal();
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

      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: dataKeranjang == null ? Container(child: Center(child: GenText("Keranjang Masih kosong"),)) : SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: dataKeranjang.map<Widget>((e) {
                      return CommonPadding(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            SizedBox(height: 20,),


                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Checkbox(
                                  onChanged: (val) {
                                    setState(() {
                                      checkboxs[e["id"]] =
                                          val;
                                      print("checked $checkboxs");
                                      // checkout();
                                    });
                                  },
                                  value: checkboxs[e["id"]],
                                ),


                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(bottom: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: GenShadow().genShadow(
                                            radius: 3.w, offset: Offset(0, 2.w))),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [

                                            Image.network(
                                              ip + e["barang"]["gambar"],
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.cover,
                                            ),

                                            Expanded(
                                              child: CommonPadding(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          GenText(
                                                            e["barang"]["nama"],
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.bold),
                                                          ),
                                                          InkWell(onTap: (){
                                                            deleteKeranjang(e["id"]);
                                                          },child: Icon(Icons.close, color: Colors.red,))
                                                        ],
                                                      ),
                                                    ),
                                                    GenText("Qty: "+ e["qty"].toString()),
                                                    SizedBox(height: 20,),
                                                    GenText("Total: "+ formatRupiah(e["sub"].toString())),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      );
                    }).toList())

              ),
            ),
            CommonPadding(child: GenText("Pilih Kota Pengiriman")),
            CommonPadding(child: dataKota != null
                ? Row(
                  children: [
                    Expanded(
                      child: DropdownButton<dynamic>(
              value: dariValue,
              elevation: 16,
              style:
              const TextStyle(color: Colors.deepPurple),
              isExpanded: true,
              onChanged: (newValue) {
                      setState(() {
                        dariValue = newValue;
                        hitungOngkir(newValue);
                        alamat = dataKota[dariValue]["city_name"] + " " + dataKota[dariValue]["province"];
                      });

              },
              items: kotaTujuan
                        .map((value, desc) {
                      // print("value " + value.toString());
                      return MapEntry(
                          desc,
                          DropdownMenuItem<String>(
                            value: value,
                            child: Text(desc),
                          ));
              })
                        .values
                        .toList(),
            ),
                    ),
                    SizedBox(width: 20,),
                    GenText(dataOngkir == null ? "Rp 0" : formatRupiahUseprefik(dataOngkir.toString()))
                  ],
                )
                : CircularProgressIndicator(),),
            CommonPadding(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 10,),
                GenText("Total Pembayaran"),
                GenText(formatRupiahUseprefik(total.toString()), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                GenButton(text: "Bayar Sekarang", ontap: (){
                  // Navigator.pushNamed(context, "pembayaran");
                  checkout();
                },),
                SizedBox(height: 16,),
              ],),
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

  void getProperty() async {
    dataKeranjang = await req.getApi("keranjang");
    dataKeranjang = dataKeranjang["payload"];

    for(int i = 0; i < dataKeranjang.length; i++){
      dataCheckBoxs[dataKeranjang[i]["id"]] = false;
    }
    print("DATA $dataKeranjang");
    print("length" + dataCheckBoxs.toString());


    setState(() {});
  }

  void getKotaOngkir() async {
    dataKota = await req.getToPortal("https://api.rajaongkir.com/starter/city", {"key":"7366bbad708dcf7d2f1b3d69e5f4219f"});
    // dataKota = dataKota["payload"];
    print("kota $dataKota");
    dataKota = dataKota["rajaongkir"]["results"];

    print("DATA KOTA $dataKota");
    // print("length" + dataKota.toString());
    if (dataKota.length != 0) {
      for (var i = 0; i < (dataKota.length); i++) {
        // print("data Kota " + dataKota[i]["city_id"].toString());
        kotaTujuan[dataKota[i]["city_id"].toString()] =
        dataKota[i]["city_name"];
      }
    }

    setState(() {});
  }

  void hitungOngkir(tujuan) async {
    dataOngkir = await req.postToPortal("https://api.rajaongkir.com/starter/cost", {"key":"7366bbad708dcf7d2f1b3d69e5f4219f", "origin" : "445", "destination": tujuan, "weight": 5, "courier": "jne"});
    // dataKota = dataKota["payload"];
    dataOngkir = dataOngkir["rajaongkir"]["results"][0]["costs"][1]["cost"][0]["value"];


    print("data Ongkir :" + dataOngkir.toString());
    setState(() {

    });
  }

  void hitungTotal(){

    total = 0;

    for(int i = 0; i < dataCheckBoxs.length; i++){
      if(dataCheckBoxs[dataKeranjang[i]["id"]]){
        if(dataOngkir != null ) {
          total = total + dataKeranjang[i]["sub"] + dataOngkir;
        }
      }
    }
  }

  void deleteKeranjang(id) async {
    var data = await req.postForm("keranjang/delete/$id", {"id": id});
    getProperty();
  }

  void checkout() async {
    var idBarangs = [];

    dataCheckBoxs.forEach((key, value) {
      if(value){
        idBarangs.add(key);
        print(idBarangs.toString());
      }
    });


    var checkout = await req.postApiuseAuth("keranjang/checkout", {"id" : idBarangs,  "ongkir": dataOngkir, "alamat": alamat, "ekspedisi": "Pengiriman Toko", "estimasi": "5 Januari 2022"});
    print("checkout :"+ checkout.toString());

    if(checkout["status"] == 200){
      Navigator.pushNamed(context, "pembayaran");
    }
  }
}
