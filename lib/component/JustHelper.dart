import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'genPreferrence.dart';

const urlVcall = "188.166.222.17";

//LOCATION


class JustHelper {


  String formatTanggal(tanggal) {
    if (tanggal != null) {
      String formattedDate = DateFormat('dd MMMM yyyy').format(tanggal);
      return formattedDate;
    } else {
      return "Pilih Tanggal";
    }
  }
}

String formatTime(tanggal) {
  if (tanggal != null) {
    String formattedDate = DateFormat('hh:mm').format(tanggal);
    return formattedDate;
  } else {
    return "Pilih Tanggal";
  }
}

List pilihJam(tanggal) {
  int now = int.parse(DateFormat('HH').format(DateTime.now()));
  DateTime tglNow = DateTime.now();
  DateTime tgl = tanggal;
  String tglString = DateFormat('yyyy-MM-dd').format(tgl);
  String tglNowString = DateFormat('yyyy-MM-dd').format(tglNow);

  List jam = [];

  if (tglString == tglNowString) {
    for (int i = 9; i <= 20; i++) {
      if (now > 9 && now <= 20) {
        if (now + 1 >= i) {
          jam.add({"jam": "${i.toString().padLeft(2, '0')}:00", "aktiv": "0"});
        } else {
          jam.add({"jam": "${i.toString().padLeft(2, '0')}:00", "aktiv": "1"});
        }

      }else if(now < 9){
        jam.add({"jam" : "${i.toString().padLeft(2, '0')}:00", "aktiv" : "1"});
      }else{
        jam.add({"jam" : "${i.toString().padLeft(2, '0')}:00", "aktiv" : "0"});
      }
    }
  } else {
    for (int i = 9; i <= 20; i++) {
      jam.add({"jam": "${i.toString().padLeft(2, '0')}:00", "aktiv": "1"});
    }
  }
  return jam;
}

bool sebelumSekarang(tanggal){
  DateTime tglNow = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  DateTime tanggalnya = dateFormat.parse(tanggal);
  if(tglNow.isBefore(tanggalnya)){
    return true;
  }
  return false;
}

bool sebelumSekarang1(tanggal){
  DateTime tglNow = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  DateTime tanggalnya = dateFormat.parse(tanggal);
  DateTime tanggalPlusSatu = tanggalnya.add(const Duration(days: 1));
  if(tglNow.isBefore(tanggalPlusSatu)){
  }

  return false;
}

String pilihTanggal(){
  int now = int.parse(DateFormat('HH').format(DateTime.now()));
  DateTime tglNow = DateTime.now();

  String  formattedDate = DateFormat('dd MMMM yyyy - 09:00').format(DateTime.now());
    for (int i = 9; i <= 20; i++) {
      if (now > 9 && now <= 20) {
        if (now + 2 == i) {
          formattedDate = DateFormat('dd MMMM yyyy - ${i.toString().padLeft(2, '0')}:00').format(tglNow);
        }
      }else if(now > 20){
        formattedDate = DateFormat('dd MMMM yyyy - 09:00').format(DateTime.now().add(new Duration(days: 1)));
      }else{
        formattedDate = DateFormat('dd MMMM yyyy - 09:00').format(DateTime.now());
      }
    }
  return formattedDate;

}

String pilihTanggalDB(){
  int now = int.parse(DateFormat('HH').format(DateTime.now()));
  DateTime tglNow = DateTime.now();

  String  formattedDate = DateFormat('yyyy-MM-dd 09:00').format(DateTime.now());
  for (int i = 9; i <= 20; i++) {
    if (now > 9 && now <= 20) {
      if (now + 2 == i) {
        formattedDate = DateFormat('yyyy-MM-dd ${i.toString().padLeft(2, '0')}:00').format(tglNow);
      }
    }else if(now > 20){
      formattedDate = DateFormat('yyyy-MM-dd 09:00').format(DateTime.now().add(new Duration(days: 1)));
    }else{
      formattedDate = DateFormat('yyyy-MM-dd 09:00').format(DateTime.now());
    }
  }
  return formattedDate;

}

String formatTanggalFormat(tanggal) {
  if (tanggal != null) {
    DateFormat dateFormat = DateFormat("dd MMMM yyyy - HH:mm");
    DateTime tanggalnya = dateFormat.parse(tanggal);
    String formattedDate =
        DateFormat('dd MMMM yyyy - HH:mm').format(tanggalnya);
    return formattedDate;
  } else {
    return "Pilih Tanggal";
  }
}

String formatHariTanggal(tanggal) {
  String formattedDate = DateFormat('EEEE').format(tanggal);
  return formattedDate;
}

String formatTanggalToDB(tanggal) {
  DateFormat dateFormat = DateFormat("dd MMMM yyyy - HH:mm");
  DateTime tanggalnya = dateFormat.parse(tanggal);
  String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(tanggalnya);
  return formattedDate;
}

String formatTanggalJamToDB(tanggal) {
  String formattedDate = DateFormat('yyyy-MM-dd HH:00').format(tanggal);
  return formattedDate;
}

String formatTanggalJamPesan(tanggal) {
  if (tanggal != null) {
    String formattedDate = DateFormat('dd MMMM yyyy - HH:00').format(tanggal);
    return formattedDate;
  } else {
    return "Pilih Tanggal";
  }
}

class GenCurrency extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // TODO: implement formatEditUpdate
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    int value = int.parse(newValue.text);
    final money = NumberFormat("###,###,###", "in-id");

    String newText = money.format(value);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

String formatRupiah(nominal) {
  final rupiah = NumberFormat("#,##0", "in_ID");
  return rupiah.format(int.parse(nominal)).toString();
}

String formatRupiahUseprefik(nominal) {
  final rupiah = NumberFormat("#,##0", "in_ID");
  return "Rp. " +
      rupiah
          .format(nominal is String ? int.parse(nominal) : nominal)
          .toString();
}

String formatTanggal(tanggal) {
  if (tanggal != null) {
    String formattedDate = DateFormat('dd MMMM yyyy').format(tanggal);
    return formattedDate;
  } else {
    return "Pilih Tanggal";
  }
}

String formatTanggalWaktu(String tanggal) {
  if (tanggal != null) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");
    DateTime tanggalnya = dateFormat.parse(tanggal);
    String formattedDate = DateFormat('dd MMMM yyyy HH:mm').format(tanggalnya);
    return formattedDate;
  } else {
    return "Pilih Tanggal";
  }
}

String formatTanggalFromString(String tanggal) {
  if (tanggal != null) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime tanggalnya = dateFormat.parse(tanggal);
    String formattedDate = DateFormat('dd MMMM yyyy').format(tanggalnya);
    return formattedDate;
  } else {
    return "-";
  }
}

String formatTanggalFromStringGMT(String tanggal) {
  if (tanggal != null) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd" + "T" + "HH:mm:ssZ");
    DateTime tanggalnya = dateFormat.parse(tanggal);
    String formattedDate = DateFormat('dd MMMM yyyy HH:mm').format(tanggalnya);
    return formattedDate;
  } else {
    return "-";
  }
}

DateTime formatkeDateTime(String tanggal) {
  if (tanggal != null) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime tanggalnya = dateFormat.parse(tanggal);
    return tanggalnya;
  } else {
    return null;
  }
}

String formatJamFromStringGMT(String tanggal) {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd" + "T" + "HH:mm:ssZ");
  DateTime tanggalnya = dateFormat.parse(tanggal);
  String formattedDate = DateFormat('HH:mm').format(tanggalnya);
  return formattedDate;
}

String hitungSelisihJamGMT(String start, String finish) {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd" + "T" + "HH:mm:ssZ");
  DateTime tglstart = dateFormat.parse(start);
  DateTime tglfinish = dateFormat.parse(finish);
  Duration tglhasil = tglfinish.difference(tglstart);
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(tglhasil.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(tglhasil.inSeconds.remainder(60));
  return "${twoDigits(tglhasil.inHours)}:$twoDigitMinutes:$twoDigitSeconds";

}

void launchWhatsApp({
  @required String phone,
  @required String message,
}) async {
  String url() {
    if (Platform.isIOS) {
      return "whatsapp://wa.me/$phone/?text=${Uri.encodeFull(message)}";
    } else {
      return "whatsapp://send?phone=$phone&text=${Uri.encodeFull(message)}";
    }
  }

  if (await canLaunch(url())) {
    await launch(url());
  } else {
    throw 'Could not launch ${url()}';
  }
}

String formatHari(day) {
  String hari;
  switch (day) {
    case '0':
      hari = 'Senin';
      break;
    case '1':
      hari = 'Selasa';
      break;
    case '2':
      hari = 'Rabu';
      break;
    case '3':
      hari = 'Kamis';
      break;
    case '4':
      hari = 'Jumat';
      break;
    case '5':
      hari = 'Sabtu';
      break;
    default:
      hari = 'Minggu';
      break;
  }
  return hari;
}

Future<String> cekRoles() async {
  var log = await getPrefferenceToken();
  return log;
}

//VALIDATION
String validateMobile(String value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,30}$)';
  RegExp regExp = new RegExp(patttern);
  if (regExp.hasMatch(value)) {
    return 'Tidak boleh memasukan nomor hp di sini';
  }
  return null;
}
String deleteFlroala(text){

  text = text.substring(0, text.indexOf('<p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered'));
}

Map hurufJawaban =
  {
    0: "a" ,
    1: "b" ,
    2: "c" ,
    3: "d" ,
    4: "e" ,
    5: "f" ,
    6: "g" ,
    7: "h" ,
    8: "i" ,
    9: "j" ,
    10: "k" ,
    11: "l"
  };

Map statusBerlangganan = {
  0: "Menunggu",
  1: "Aktif",
  9: "Selesai",
  6: "Pesanan di batalkan"
};

List jam = [
  {"jam": "09:00"},
  {"jam": "10:00"},
  {"jam": "11:00"},
  {"jam": "12:00"},
  {"jam": "13:00"},
  {"jam": "14:00"},
  {"jam": "15:00"},
  {"jam": "16:00"},
  {"jam": "17:00"},
  {"jam": "18:00"},
  {"jam": "19:00"},
  {"jam": "20:00"},
];

List hari = [
  {"hari": 0},
  {"hari": 1},
  {"hari": 2},
  {"hari": 3},
  {"hari": 4},
  {"hari": 5},
  {"hari": 6},
];