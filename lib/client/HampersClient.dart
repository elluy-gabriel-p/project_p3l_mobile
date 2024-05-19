import 'package:project_p3l_mobile/data/Hampers.dart';

import 'dart:convert';
import 'package:http/http.dart';

class HampersClient {
  static final String url = '10.0.2.2:8000';
  static final String endpoint = '/api/hampers';

  static Future<List<Hampers>> fetchAll() async {
    try {
      var response = await get(Uri.http(url, endpoint));

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Iterable list = json.decode(response.body)['data'];

      return list.map((e) => Hampers.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Hampers> find(id) async {
    try {
      var response = await get(Uri.http(url, '$endpoint/$id'));

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return Hampers.fromJson(json.decode(response.body)['data']);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Response> create(Hampers hampers) async {
    try {
      var response = await post(Uri.http(url, endpoint),
          headers: {"Content-type": "application/json"},
          body: hampers.toRawJson());

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Response> update(Hampers hampers) async {
    try {
      var response = await put(Uri.http(url, '$endpoint/${hampers.id_hampers}'),
          headers: {"Content-type": "application/json"},
          body: hampers.toRawJson());

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
