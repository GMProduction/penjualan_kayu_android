// ignore: file_names
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'blocks/baseBloc.dart';
import 'component/JustHelper.dart';
import 'component/NavDrawer.dart';
import 'component/commonPadding.dart';
import 'component/genButton.dart';
import 'component/genColor.dart';
import 'component/genDimen.dart';
import 'component/genRadioMini.dart';
import 'component/genShadow.dart';
import 'component/genText.dart';
import 'component/request.dart';
import 'component/textAndTitle.dart';

class DetailKos extends StatefulWidget {
  var id;

  DetailKos({this.id});

  @override
  _DetailKosState createState() => _DetailKosState();
}

class _DetailKosState extends State<DetailKos> with WidgetsBindingObserver {
  final req = new GenRequest();

  bool loading = false;

  // NotifBloc notifbloc;
  bool isLoaded = false;
  String dropdownValue = 'One';

//  double currentgurulainValue = 0;
  PageController gurulainController = PageController();
  var stateMetodBelajar = 1;
  var bloc;
  var clientId, dataProperty, id;
  var stateHari;
  var kelas;
  dynamic dataJadwal;

  var startTime = TimeOfDay.fromDateTime(DateTime.now());
  var endTime = TimeOfDay.fromDateTime(DateTime.now());
  var selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    // analytics.

    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

//  FUNCTION

//  getClientId() async {
//    clientId = await getPrefferenceIdClient();
//    if (clientId != null) {
//      print("CLIENT ID" + clientId);
//    }
//  }

//  getRoom() async {
//    clienId = await getPrefferenceIdClient();
//    return clienId;
//  }

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

    final DetailKos args = ModalRoute.of(context).settings.arguments;
    id = args.id;

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
      getProperty(id);
      isLoaded = true;
    }

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
                    Icon(
                      Icons.notifications,
                      size: 26.0,
                    ),
                  ],
                ),
              )),
        ],
      ),
      body: SafeArea(
        child: dataProperty == null
            ? Container()
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            ip + dataProperty["foto"],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CommonPadding(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: GenText(
                                    dataProperty["nama"] + " .",
                                    style: TextStyle(
                                        fontSize: GenDimen.fontSizeBawah),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: GenColor.primaryColor,
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: GenText(
                                     dataProperty["peruntukan"] ,
                                    style: TextStyle(
                                        fontSize: GenDimen.fontSizeBawah),
                                  ),
                                ),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                // Icon(
                                //   Icons.star,
                                //   size: GenDimen.fontSizeBawah,
                                // ),
                                // SizedBox(
                                //   width: 5,
                                // ),
                                // GenText(
                                //   "4.1",
                                //   style: TextStyle(fontSize: GenDimen.fontSizeBawah),
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CommonPadding(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: GenDimen.fontSizeBawah,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GenText(
                                  dataProperty["alamat"],
                                  style: TextStyle(
                                      fontSize: GenDimen.fontSizeBawah),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          CommonPadding(
                              child: GenText(
                                dataProperty["keterangan"],
                            style:
                                TextStyle(fontSize: 14, color: Colors.black45),
                          )),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
              ),
            ),
            CommonPadding(
                child: Row(
              children: [
                Container(
                  width: 200,
                  child: Center(
                    child: GenText(
                      formatRupiahUseprefik(dataProperty["harga"])+"/ bulan",
                      style: TextStyle(
                          fontSize: GenDimen.fontSizeBawah,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: GenButton(
                    text: "Hubungi Pemilik",
                    ontap: () {
                      launchWhatsApp(phone: dataProperty["user"]["no_hp"], message: "halo saya ingin pesan kos "+dataProperty["nama"]);
                    },
                  ),
                ),
              ],
            )),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }

  void getProperty(id) async {
    dataProperty = await req.getApi("user/kos/" + id.toString());

    print("DATA $dataProperty");
    print("length" + id.toString());

    setState(() {});
  }
}
