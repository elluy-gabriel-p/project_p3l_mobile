import 'package:project_p3l_mobile/data/Resep.dart';

import 'dart:convert';
import 'package:http/http.dart';

class ResepClient {
  static final String url = '10.0.2.2:8000';
  static final String endpoint = '/api/resep';

  static Future<List<Resep>> fetchAll() async {
    try {
      var response = await get(Uri.http(url, endpoint));

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Iterable list = json.decode(response.body)['data'];

      return list.map((e) => Resep.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Resep> find(id) async {
    try {
      var response = await get(Uri.http(url, '$endpoint/$id'));

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return Resep.fromJson(json.decode(response.body)['data']);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Response> create(Resep resep) async {
    try {
      var response = await post(Uri.http(url, endpoint),
          headers: {"Content-type": "application/json"},
          body: resep.toRawJson());

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Response> update(Resep resep) async {
    try {
      var response = await put(Uri.http(url, '$endpoint/${resep.id_resep}'),
          headers: {"Content-type": "application/json"},
          body: resep.toRawJson());

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
