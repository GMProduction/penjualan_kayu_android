// ignore: file_names
import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:penjualan_kayu/DetailBarang.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
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
import 'component/genToast.dart';
import 'component/request.dart';
import 'component/textAndTitle.dart';

class Permbayaran extends StatefulWidget {
  final int id;

  Permbayaran({this.id});


  @override
  _PermbayaranState createState() => _PermbayaranState();
}

class _PermbayaranState extends State<Permbayaran> with WidgetsBindingObserver {
  final req = new GenRequest();

//  VARIABEL

  bool loading = false;

  // NotifBloc notifbloc;
  bool isLoaded = false;

//  double currentgurulainValue = 0;
  PageController gurulainController = PageController();
  var stateMetodBelajar = 1;
  var bloc, dataTransaksi;
  var clientId;
  var id;
  bool readyToHit = true;
  var stateHari;
  var dariValue, keValue, totalpenumpang;
  dynamic dataUser;

  @override
  void initState() {
    // TODO: implement initState
    // analytics.
    getUser();

    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  String clienId;
  var _picker,  dataPesanan, dataJadwal;
  XFile _image;

  Future<XFile> pickImage() async {
    final _picker = ImagePicker();

    final XFile pickedFile =
    await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      print('PickedFile: ${pickedFile.toString()}');
      setState(() {
        _image = XFile(pickedFile.path); // Exception occurred here
      });
    } else {
      print('PickedFile: is null');
    }

    if (_image != null) {
      return _image;
    }
    return null;
  }

  void takepic() async {
    final XFile photo = await _picker.pickImage(source: ImageSource.camera);
  }

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

    final Permbayaran args = ModalRoute
        .of(context)
        .settings
        .arguments;
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
      getTransaksi(id);

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
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            CommonPadding(child: GenText("Lakukan Pembayaran di:")),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: GenShadow().genShadow(
                                    radius: 3.w, offset: Offset(0, 2.w))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Bank_Central_Asia.svg/2560px-Bank_Central_Asia.svg.png",
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fitWidth,
                                    ),
                                    Expanded(
                                      child: CommonPadding(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GenText(
                                                    "BANK BCA",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),

                                                ],
                                              ),
                                            ),
                                            GenText("A/N JOKO NDOKONDO"),
                                            GenText("NO. REK: 746821789"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    CommonPadding(
                      child: Container(
                        child: GenButton(
                          padding: EdgeInsets.all(10),
                          color: Colors.grey,
                          text: "Upload Bukti",
                          ontap: () {
                            pickImage();
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    _image == null
                        ? Container(
                      width: 100,
                      height: 100,
                    )
                        : Center(
                          child: Image.file(
                      File(_image.path),
                      width: 100,
                    ),
                        ),
                  ],
                ),
              ),
            ),
            CommonPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  GenText("Total Pembayaran"),
                  GenText(
                    dataTransaksi != null ? formatRupiahUseprefik(dataTransaksi["total"].toString()) : 0.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  readyToHit
                      ? GenButton(
                    text: "SUBMIT",
                    ontap: () {
                      // login(email, password);
                      upLoadBukti(id, _image);
                    },
                  )
                      : CircularProgressIndicator(),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void getUser() async {

  }

  void getTransaksi(id) async {
    dataTransaksi = await req.getApi("transaksi/$id");
    dataTransaksi = dataTransaksi["payload"];
    print("DATA $dataTransaksi");
    print("length" + dataTransaksi.length.toString());

    setState(() {});
  }

  void upLoadBukti(
      id,
      bukti
      ) async {

    String fileName = bukti.path.split('/').last;


    setState(() {
      readyToHit = false;
    });
    dynamic data;
    data = await req.postForm("transaksi/"+id.toString(), {
      "bank": "BCA",
      "bukti":
      await MultipartFile.fromFile(bukti.path, filename:fileName)
    });

    print(data);

    setState(() {
      readyToHit = true;
    });

    if (data["status"] == 200) {
      setState(() {
        toastShow("Bukti berhasil di upload", context, Colors.black);
        Navigator.pushReplacementNamed(context, "base");

      });

    } else {
      setState(() {
        toastShow(data.toString(), context, GenColor.red);
      });
    }
  }
}
