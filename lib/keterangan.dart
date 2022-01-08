import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'component/JustHelper.dart';
import 'component/TextFieldLogin.dart';
import 'component/genButton.dart';
import 'component/genColor.dart';
import 'component/genPreferrence.dart';
import 'component/genText.dart';
import 'component/genToast.dart';
import 'component/request.dart';

class Keterangan extends StatefulWidget {
  final int id;
  final int idp;

  Keterangan({this.id, this.idp});

  @override
  _KeteranganState createState() => _KeteranganState();
}

class _KeteranganState extends State<Keterangan> {
  bool readyToHit = true;
  final req = new GenRequest();

  var dataProperty, id,idp, perkembangan;
  bool isloaded = false;

  @override
  Widget build(BuildContext context) {

    final Keterangan args = ModalRoute.of(context).settings.arguments;
    id = args.id;
    idp = args.idp;


    if (!isloaded) {
      getProperty(idp, id);
      isloaded = true;
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "Keterangan Proses Pembangunan",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: GenColor.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Icon(Icons.circle, color: Colors.white, size: 15,),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GenText("Nomor Pesanan", style: TextStyle(color: Colors.white70),),
                            GenText(dataProperty["no_pesanan"], style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                          ],
                        )
                      ],),
                      SizedBox(height: 10,),
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.circle, color: Colors.white, size: 15,),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GenText("Tipe Rumah", style: TextStyle(color: Colors.white70),),
                              GenText(dataProperty["tipe_rumah"], style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                            ],
                          )
                        ],),
                      SizedBox(height: 10,),

                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.circle, color: Colors.white, size: 15,),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GenText("Tanggal", style: TextStyle(color: Colors.white70),),
                              GenText(formatTanggalFromString(dataProperty["tanggal_beli"]), style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                            ],
                          )
                        ],),
                      SizedBox(height: 10,),

                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.circle, color: Colors.white, size: 15,),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GenText("Keterangan & Gambar", style: TextStyle(color: Colors.white70),),
                            ],
                          )
                        ],),
                      SizedBox(height: 10,),

                      CarouselSlider(
                          items: [Image.asset("asset/logo.png")],
                          options: CarouselOptions(
                            height: 300,
                            aspectRatio: 16/9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          )
                      ),

                      GenText(dataProperty["deskripsi"], style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    ],
                  ),
                ),
          )),
        ]),
      ),
    );
  }

  void getProperty(idp, id) async {

    dataProperty = await req.getApi("pesanan/"+idp.toString()+"/detail/" + id.toString());

    print("DATA $dataProperty");
    print("length" + dataProperty.length.toString());

    setState(() {});
  }
}
