import 'package:project_p3l_mobile/data/BahanBaku.dart';

import 'dart:convert';
import 'package:http/http.dart';

class BahanBakuClient {
  static final String url = '10.0.2.2:8000';
  static final String endpoint = '/api/bahanBaku';

  static Future<List<BahanBaku>> fetchAll() async {
    try {
      var response = await get(Uri.http(url, endpoint));

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Iterable list = json.decode(response.body)['data'];

      return list.map((e) => BahanBaku.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<BahanBaku> find(id) async {
    try {
      var response = await get(Uri.http(url, '$endpoint/$id'));

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return BahanBaku.fromJson(json.decode(response.body)['data']);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Response> create(BahanBaku bahanBaku) async {
    try {
      var response = await post(Uri.http(url, endpoint),
          headers: {"Content-type": "application/json"},
          body: bahanBaku.toRawJson());

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Response> update(BahanBaku bahanBaku) async {
    try {
      var response = await put(
          Uri.http(url, '$endpoint/${bahanBaku.id_bahan_baku}'),
          headers: {"Content-type": "application/json"},
          body: bahanBaku.toRawJson());

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Response> destroy(id) async {
    try {
      var response = await delete(Uri.http(url, '$endpoint/$id'));

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
