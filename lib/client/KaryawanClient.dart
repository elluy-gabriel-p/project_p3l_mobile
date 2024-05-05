import 'package:project_p3l_mobile/data/Karyawan.dart';

import 'dart:convert';
import 'package:http/http.dart';

class karyawanClient {
  static final String url = '10.0.2.2:8000';
  static final String endpoint = '/api/karyawan';
  //janlup ganti ini kalo perlu ganti

  static Future<List<Karyawan>> fetchAll() async {
    try {
      var response = await get(Uri.http(url, endpoint));
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Iterable list = json.decode(response.body)['data'];

      return list.map((e) => Karyawan.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Karyawan> find(id) async {
    try {
      var response = await get(Uri.http(url, '$endpoint/$id'));
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);
      return Karyawan.fromJson(json.decode(response.body)['data']);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Response> create(Karyawan karyawan) async {
    try {
      print(Uri.http(url, endpoint));
      print(karyawan.toRawJson());
      print("Karyawan ID in JSON: ${karyawan.toJson()['profilePicture']}");
      var response = await post(Uri.http(url, endpoint),
          headers: {"Content-Type": "application/json"},
          body: karyawan.toRawJson());
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);
      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Response> update(Karyawan karyawan) async {
    try {
      var response = await put(Uri.http(url, '$endpoint/${karyawan.id}'),
          headers: {"Content-Type": "application/json"},
          body: karyawan.toRawJson());
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);
      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Karyawan> Login(String username, String password) async {
    try {
      var response = await post(Uri.http(url, "/api/loginAdmin"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"username": username, "password": password}));
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);
      return Karyawan.fromJson(json.decode(response.body)['data']);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Response> ResetPass(String username, String newPass) async {
    try {
      var response = await post(Uri.http(url, "/api/resetPassword"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"username": username, "password": newPass}));
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);
      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<LoginModel?> logintesting({
    required String username,
    required String password,
  }) async {
    String uri = '127.0.0.1:8000';

    try {
      var apiResult = await post(Uri.http(uri, "/api/loginAdmin"),
          body: jsonEncode({"username": username, "password": password}));
      if (apiResult.statusCode == 200) {
        final result = LoginModel.fromRawJson(apiResult.body);
        return result;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
