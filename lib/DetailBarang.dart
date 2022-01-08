// ignore: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:penjualan_kayu/component/genToast.dart';

import 'component/JustHelper.dart';
import 'component/NavDrawer.dart';
import 'component/commonPadding.dart';
import 'component/genButton.dart';
import 'component/genColor.dart';
import 'component/genText.dart';
import 'component/request.dart';

class DetailBarang extends StatefulWidget {
  final int id;

  DetailBarang({this.id});

  @override
  _DetailBarangState createState() => _DetailBarangState();
}

class _DetailBarangState extends State<DetailBarang>
    with WidgetsBindingObserver {
  final req = new GenRequest();

  bool loading = false;
  bool readyToHit = true;

  // NotifBloc notifbloc;
  bool isLoaded = false;
  String dropdownValue = 'One';

//  double currentgurulainValue = 0;


  int jumlah = 1;
  var dataBarang, id, perkembangan, items, stateDuration, stateHarga;
  bool isloaded = false;

  var startTime = TimeOfDay.fromDateTime(DateTime.now());
  var endTime = TimeOfDay.fromDateTime(DateTime.now());
  var selectedDate = DateTime.now();
  String _hour, _minute, _time;
  TextEditingController _timeController = TextEditingController();

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


  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: startTime,
    );
    if (picked != null)
      setState(() {
        startTime = picked;
        _hour = startTime.hour.toString();
        _minute = startTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
      });
  }

  String clienId;

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
    final DetailBarang args = ModalRoute
        .of(context)
        .settings
        .arguments;
    id = args.id;

    if (!isloaded) {
      getDetail(id);
      isloaded = true;
    }


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

    if (!isLoaded) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: dataBarang == null
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      ip + dataBarang["gambar"],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GenText(
                            dataBarang["nama"],
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              GenText(formatRupiahUseprefik(
                                  dataBarang["harga"].toString()) + " /",
                                style: TextStyle(
                                  fontSize: 18,),),
                              GenText(dataBarang["satuan"].toString(),
                                style: TextStyle(
                                  fontSize: 18,),
                              ),
                            ],
                          ),
                          SizedBox(height: 30,),
                          // GenText(dataBarang["keterangan"]),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                  ],
                ),
              ),
            ),
            Column(
              children: [
                CommonPadding(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GenText("Masukan jumlah"),
                    Row(
                      children: [
                        FloatingActionButton(mini: true,
                          onPressed: (){
                            minusButton();
                          },
                          child: Icon(Icons.remove_circle_outline),
                          backgroundColor: GenColor.primaryColor,),
                        SizedBox(width: 10,),
                        GenText(jumlah.toString(), style: TextStyle(
                            fontSize: 20),),
                        SizedBox(width: 10,),
                        FloatingActionButton(mini: true,
                          onPressed: (){
                            addButton();
                          },
                          child: Icon(Icons.add_circle_outline),
                          backgroundColor: GenColor.primaryColor,),
                      ],
                    ),
                  ],
                )),

                SizedBox(height: 10,),
                CommonPadding(
                    child: readyToHit
                        ? GenButton(
                      text: "Masukan Ke keranjang",
                      ontap: () {
                        inputKeranjang(id, jumlah);
                      },
                    )
                        : Center(child: CircularProgressIndicator())),
              ],
            ),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }


  addButton() {
    if (jumlah < 99) {
      jumlah = jumlah + 1;
    } else {
      toastShow("jumlah sudah melebihi batas maximum", context, Colors.black);
    }

    setState(() {

    });
  }

  minusButton() {
    if (jumlah > 1) {
      jumlah = jumlah - 1;
    } else {
      toastShow("jumlah harus lebih dr 0", context, Colors.black);
    }

    setState(() {

    });
  }


  void getDetail(id) async {
    print("GET Barang $dataBarang");

    dataBarang = await req.getApi("barang/$id");

    dataBarang = dataBarang["payload"];

    print("DATA Barang $dataBarang");

    setState(() {});
  }

  void inputKeranjang(id, qty) async {

    setState(() {
      readyToHit = false;
    });

    dynamic data;
    data = await req.postForm("keranjang", {"barang" : id, "qty": qty});

    print("DATA $data");

    setState(() {
      readyToHit = true;
    });


    print("DATA KERANJANG $data");

    if (data["status"] == 200) {
      setState(() {
        Navigator.pushReplacementNamed(context, "keranjang");
        toastShow("Berhasil dimasukan ke keranjang", context,
            Colors.black);
      });
    } else if (data["status"] == 202) {
      setState(() {
        toastShow(data["message"], context, GenColor.red);
      });
    } else {
      setState(() {
        toastShow("Terjadi kesalahan coba cek koneksi internet kamu", context,
            GenColor.red);
      });
    }
  }
}
