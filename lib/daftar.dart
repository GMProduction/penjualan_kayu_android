import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'component/TextFieldLogin.dart';
import 'component/genButton.dart';
import 'component/genColor.dart';
import 'component/genPreferrence.dart';
import 'component/genText.dart';
import 'component/genToast.dart';
import 'component/request.dart';
import 'login.dart';

class Daftar extends StatefulWidget {

  @override
  _DaftarState createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  bool readyToHit = true;
  final req = new GenRequest();

  var email, password;
  var nama, username, alamat, no_hp, conf_password;
  var _picker, roles;
  XFile _image;


  Future<XFile> pickImage() async {
    final _picker = ImagePicker();

    final XFile pickedFile = await _picker.pickImage(source: ImageSource.camera);

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



  Future<void> getLostData() async {
    final LostDataResponse response =
    await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.files != null) {
      for(final XFile file in response.files) {
        // _handleFile(file);
      }
    } else {
      // _handleError(response.exception);
    }
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "DAFTAR",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              TextLoginField(
                initVal: "",
                width: double.infinity,
                label: "Nama",
                keyboardType: TextInputType.name,
//                                    controller: tecNumber,
                onChanged: (val) {
                  nama = val;
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
                height: 20,
              ),
              TextLoginField(
                initVal: "",
                width: double.infinity,
                label: "Alamat",
                keyboardType: TextInputType.streetAddress,
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
                initVal: "",
                width: double.infinity,
                label: "No. HP",
                keyboardType: TextInputType.number,
//                                    controller: tecNumber,
                onChanged: (val) {
                  no_hp = val;
                },
                validator: (val) {
                  if (val.length < 1) {
                    return "Isi No HP";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   child: Row(
              //     children: [
              //       Container(
              //         width: 85,
              //         child: GenButton(text: "Avatar", ontap: (){
              //           pickImage();
              //         },),
              //       ),
              //       SizedBox(width: 20,),
              //       _image == null ? Container(width: 100, height: 100,) :
              //       Image.file(File(_image.path), width: 100,),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              TextLoginField(
                initVal: "",
                width: double.infinity,
                label: "Username",
                keyboardType: TextInputType.emailAddress,
//                                    controller: tecNumber,
                onChanged: (val) {
                  username = val;
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
              TextLoginField(
                initVal: "",
                width: double.infinity,
                label: "Password",
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
//                                    controller: tecNumber,
                onChanged: (val) {
                  password = val;
                },
                validator: (val) {
                  if (val.length < 1) {
                    return "Isi password dengan benar";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextLoginField(
                initVal: "",
                width: double.infinity,
                label: "Konfirmasi password",
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
//                                    controller: tecNumber,
                onChanged: (val) {
                  conf_password = val;
                },
                validator: (val) {
                  if (val.length < 1) {
                    return "Isi konfirmasi password dengan benar";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              readyToHit
                  ? GenButton(
                      text: "DAFTAR",
                      ontap: () {
                        // login(email, password);
                        // Navigator.pushNamed(context, "base");
                        daftar(nama, alamat, no_hp, username, password, conf_password);
                      },
                    )
                  : CircularProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "login", arguments: Login(

                    ));
                  },
                  child: GenText(
                    "Sudah punya akun ? Masuk disini",
                    style: TextStyle(fontSize: 16),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void login(username, pass) async {
    setState(() {
      readyToHit = false;
    });
    dynamic data;
    data = await req.postApi("login", {"username": username, "password": pass});

    print("DATA $data");
    setState(() {
      readyToHit = true;
    });
    if (data["status"] == 200) {
      setState(() {
        setPrefferenceToken(data["data"]["token"]);
        Navigator.pushReplacementNamed(context, "propertymu");
      });
    } else if (data["code"] == 202) {
      setState(() {
        toastShow(data["payload"]["msg"], context, GenColor.red);
      });
    } else {
      setState(() {
        toastShow("Terjadi kesalahan coba cek koneksi internet kamu", context,
            GenColor.red);
      });
    }
  }

  void daftar(nama, alamat, no_hp, username, pass, konfpassword) async {
    setState(() {
      readyToHit = false;
    });


    dynamic data;
    data = await req.postRegisterForm("auth/register", {
      "username": username,
      "password": pass,
      "nama": nama,
      "alamat": alamat,
      "no_hp": no_hp,
      "password_confirmation": konfpassword,
      "roles": roles,
    });

    print("DATA $data");
    setState(() {
      readyToHit = true;
    });
    if (data["status"] == 200) {
      setState(() {
        setPrefferenceToken(data["payload"]["access_token"]);

        Navigator.pushReplacementNamed(context, "base");
      });
    } else if (data["code"] == 202) {
      setState(() {
        toastShow(data["payload"]["msg"], context, GenColor.red);
      });
    } else {
      setState(() {
        toastShow("Terjadi kesalahan coba cek koneksi internet kamu", context,
            GenColor.red);
      });
    }
  }
}
