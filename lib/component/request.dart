import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'genPreferrence.dart';


String ip = "http://192.168.137.1:8000";

String token;

getIp() {
  return ip;
}

convertUrlAsset(img) {
  return img == null
      ? null
      : (img.indexOf("http") >= 0 ? "$img" : getIp() + "$img");
}

Future postLogin(String token, String fcm, String deviceId, String deviceModel,
    String provider) async {
  try {
    String path = "$ip/api-login";
    Response response = await Dio().post(path, data: {
      "idToken": token,
      "fcmToken": fcm,
      "role": "member",
      "deviceId": deviceId,
      "deviceModel": deviceModel,
      "provider": provider
    });

    return response.data;
  } catch (e) {
    return null;
  }
}

Future postLoginEmail(
    String email,
    String password,
    String idToken,
    String fcmToken,
    String deviceId,
    String deviceModel,
    String provider,
    bool socialVerify) async {
  try {
    String path = "$ip/api-login";
    Response response = await Dio().post(path, data: {
      "idToken": idToken,
      "fcmToken": fcmToken,
      "role": "member",
      "deviceId": deviceId,
      "deviceModel": deviceModel,
      "provider": provider,
      "email": email,
      "password": password,
      "socialVerify": socialVerify
    });

    return response.data;
  } catch (e) {
    return null;
  }
}

Future postLoginEmailTrue(
    String email,
    String password,
    String idToken,
    String fcmToken,
    String deviceId,
    String deviceModel,
    String provider,
    bool socialVerify) async {
  try {
    String path = "$ip/api-login";
    Response response = await Dio().post(path, data: {
      "idToken": idToken,
      "fcmToken": fcmToken,
      "role": "member",
      "deviceId": deviceId,
      "deviceModel": deviceModel,
      "provider": provider,
      "email": email,
      "password": password,
      "socialVerify": true
    });

    return response.data;
  } catch (e) {
    return null;
  }
}

dynamic get(portal) async {
  try {
    var token = await getPrefferenceToken();
    Response response = await Dio().get(ip + "/" + portal,
        options: Options(headers: {'GENOSSYS-X': 'OMAHGUE ' + token}));
    return response.data;
  } catch (e) {
    return null;
  }
}

class GenRequest {
  getApi(portal) async {
    try {
      var token = await getPrefferenceToken();
      print(token);
      Response response;
      response = await Dio().get(ip + "/api/" + portal,
          options: Options(headers: {'Authorization':'Bearer ' + token, 'Accept': 'application/json'}));
      return response.data;
    } catch (e) {
      print("eee $e");
      return {"code": 500, "message": e.toString()};
    }
  }

  getApiPublic(portal) async {
    try {
      Response response = await Dio().get(ip + "/api-public/" + portal);
      return response.data;
    } catch (e) {
      return {"code": 500, "msg": e};;
    }
  }

  postForm(portal, data) async {
    try {
      var token = await getPrefferenceToken();
      String path = "$ip/api/$portal";
      print(path);
      Response response = await Dio().post(path,
          data: FormData.fromMap(data),
          options: Options(
              followRedirects: false,
              // will not throw errors
              validateStatus: (status) => true,
              headers: {'Authorization':'Bearer '+token, 'Accept': 'application/json'},
              contentType: 'multipart/form-data'));

      return response.data;
    } catch (e) {
      // return {"code": e.toString(), "msg": e.toString()};
      return "sukses";
    }
  }

  postRegisterForm(portal, data) async {
    try {
      var token = await getPrefferenceToken();
      String path = "$ip/api/$portal";
      print(path);
      Response response = await Dio().post(path,
          data: FormData.fromMap(data),
          options: Options(
              followRedirects: false,
              // will not throw errors
              validateStatus: (status) => true,
              headers: {'Accept': 'application/json'},
              contentType: 'multipart/form-data'));

      return response.data;
    } catch (e) {
      return {"code": e.toString(), "msg": e.toString()};
    }
  }
  postFormWoApi(portal, data) async {
    try {
      var token = await getPrefferenceToken();
      String path = "$ip/$portal";
      Response response = await Dio().post(path,
          data: FormData.fromMap(data),
          options: Options(
              headers: {'GENOSSYS-X': 'Teman ' + token},
              contentType: 'multipart/form-data'));

      return response.data;
    } catch (e) {
      return {"code": 500};
    }
  }

  postApi(portal, Map<dynamic, dynamic> data) async {
    try {

      print("data" +data.toString());

      print("ipnya "+ip + "/api/" + portal);
      Response response = await Dio().post(ip + "/api/" + portal,
          data: data,
          options: Options(headers: {'Accept': 'application/json'}));

      return response.data;
    } catch (e) {
      return {"code": e.toString()};
    }
  }


  postApiuseAuth(portal, Map<dynamic, dynamic> data) async {
    try {
      print("data" +data.toString());
      var token = await getPrefferenceToken();
      print("ipnya "+ip + "/api/" + portal);
      Response response = await Dio().post(ip + "/api/" + portal,
          data: data,
          options: Options(
              followRedirects: false,
              // will not throw errors
              validateStatus: (status) => true,
              headers: {'Authorization':'Bearer '+token, 'Accept': 'application/json'}));

      return response.data;
    } catch (e) {
      return {"code": e.toString()};
    }
  }

  getApiUsingParams(portal, params) async {
    try {
      var token = await getPrefferenceToken();

      Response response;
      response = await Dio().get(ip + "/api/" + portal,
          queryParameters: params,
          options: Options(
              followRedirects: false,
              // will not throw errors
              validateStatus: (status) => true,
              headers: {'Authorization':'Bearer '+token, 'Accept': 'application/json'},
              contentType: Headers.jsonContentType
          ));
      print(response.realUri);
      return response.data;
    } catch (e) {
      return {"code": 500, "msg": e};
    }
  }

  getToPortal(portal, params) async {
    try {

      Response response;
      response = await Dio().get(portal,
          queryParameters: params,
          options: Options(
              followRedirects: false,
              // will not throw errors
              validateStatus: (status) => true,
              headers: {'Accept': 'application/json'},
              contentType: Headers.jsonContentType
          ));
      print(response.realUri);
      return response.data;
    } catch (e) {
      return {"code": 500, "msg": e};
    }
  }

  postToPortal(portal, data) async {
    try {
      var token = await getPrefferenceToken();
      String path = "$portal";
      print(path);
      Response response = await Dio().post(path,
          data: FormData.fromMap(data),
          options: Options(
              followRedirects: false,
              // will not throw errors
              validateStatus: (status) => true,
              headers: {'Authorization':'Bearer '+token, 'Accept': 'application/json'}));

      return response.data;
    } catch (e) {
      // return {"code": e.toString(), "msg": e.toString()};
      return "error";
    }
  }

  deleteApi(portal) async {
    var token = await getPrefferenceToken();

    try {
      Response response = await Dio().delete(ip + "/api/" + portal,
          options: Options(headers: {'GENOSSYS-X': 'Teman ' + token}));
      return response.data;
    } catch (e) {
      return 500;
    }
  }
}
