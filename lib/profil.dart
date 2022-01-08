import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'component/TextFieldLogin.dart';
import 'component/commonPadding.dart';
import 'component/genButton.dart';
import 'component/genColor.dart';
import 'component/genRadioMini.dart';
import 'component/genText.dart';
import 'component/genToast.dart';
import 'component/request.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  bool readyToHit = true;
  final req = new GenRequest();
  var name, alamat, no_hp, ktp, avatar;
  dynamic dataUser;

  @override
  void initState() {
    // TODO: implement initState
    // analytics.
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(name);

    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        width: double.infinity,
        child: name == null
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    GenText(
                      "Profil",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextLoginField(
                      initVal: name,
                      width: double.infinity,
                      label: "Nama",
                      keyboardType: TextInputType.text,
//                                    controller: tecNumber,

                      onChanged: (val) {
                        name = val;
                      },
                      validator: (val) {
                        if (val.length < 1) {
                          return "Isi Nama Dengan Benar";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextLoginField(
                      initVal: alamat,
                      width: double.infinity,
                      label: "Alamat",
                      keyboardType: TextInputType.text,
//                                    controller: tecNumber,
                      onChanged: (val) {
                        alamat = val;
                      },
                      validator: (val) {
                        if (val.length < 1) {
                          return "Isi Alamat Dengan Benar";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextLoginField(
                      initVal: no_hp,
                      width: double.infinity,
                      label: "No. HP",
                      keyboardType: TextInputType.emailAddress,
//                                    controller: tecNumber,
                      onChanged: (val) {
                        no_hp = val;
                      },
                      validator: (val) {
                        if (val.length < 1) {
                          return "Isi Email Dengan Benar";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    readyToHit
                        ? GenButton(
                            text: "UBAH",
                            ontap: () {
                              postUser();
                            },
                          )
                        : CircularProgressIndicator(),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  void getUser() async {
    dataUser = await req.getApi("profil");
    dataUser = dataUser["payload"];

    name = dataUser["nama"];
    alamat = dataUser["alamat"];
    no_hp = dataUser["no_hp"];
    // email = dataUser["data"]["email"];
    // stateKelas = dataUser["data"]["kelas"];
    // nim = dataUser["data"]["nim"].toString();
    // jurusan = dataUser["data"]["jurusan"];

    print(dataUser);
    print(name);
    setState(() {});
  }

  void postUser() async {
    dataUser = await req.postApiuseAuth(
        "profil", {"nama": name, "alamat": alamat, "no_hp": no_hp});

    toastShow("Profil berhasil di ubah", context, Colors.black87);

    // email = dataUser["data"]["email"];
    // stateKelas = dataUser["data"]["kelas"];
    // nim = dataUser["data"]["nim"].toString();
    // jurusan = dataUser["data"]["jurusan"];

    print(dataUser);
    print(name);
    setState(() {});
  }
}
