import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'component/TextFieldLogin.dart';
import 'component/genButton.dart';
import 'component/genColor.dart';
import 'component/genPreferrence.dart';
import 'component/genText.dart';
import 'component/genToast.dart';
import 'component/request.dart';
import 'daftar.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool readyToHit = true;
  final req = new GenRequest();


  var email, password;

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
                height: 100,
              ),
              Image.asset(
                'assets/logo.jpeg',
                width: 50,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Selamat Datang Di",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Mekar Makmur",
                style: TextStyle(
                    color: GenColor.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),



              SizedBox(
                height: 50,
              ),
              TextLoginField(
                initVal: "",
                width: double.infinity,
                label: "Username",
                keyboardType: TextInputType.emailAddress,
//                                    controller: tecNumber,
                onChanged: (val) {
                  email = val;
                },
                validator: (val) {
                  if (val.length < 1) {
                    return "Isi username Dengan Benar";
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
                label: "password",
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
                height: 30,
              ),
              readyToHit
                  ? GenButton(
                text: "SIGN IN",
                ontap: () {
                  login(email, password);
                },
              )
                  : CircularProgressIndicator(),

              SizedBox(height: 10,),
              InkWell(onTap: () {
                Navigator.pushNamed(
                    context, "daftar");
              },
                  child: GenText("Belum punya akun ? Daftar disini",
                    style: TextStyle(fontSize: 16),))
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
    data = await req.postApi("auth/login", {"username": username, "password": pass});

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
    }
    else if (data["msg"] != null) {
      setState(() {
        toastShow(data["msg"], context, GenColor.red);
      });
    } else {
      setState(() {
        toastShow("Terjadi kesalahan coba cek koneksi internet kamu", context,
            GenColor.red);
      });
    }
  }

}
