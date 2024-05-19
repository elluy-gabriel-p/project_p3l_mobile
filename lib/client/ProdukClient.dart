import 'package:project_p3l_mobile/data/Produk.dart';

import 'dart:convert';
import 'package:http/http.dart';

class ProdukClient {
  static final String url = '10.0.2.2:8000';
  static final String endpoint = '/api/produk';

  static Future<List<Produk>> fetchAll() async {
    try {
      var response = await get(Uri.http(url, endpoint));

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Iterable list = json.decode(response.body)['data'];

      return list.map((e) => Produk.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Produk> find(id) async {
    try {
      var response = await get(Uri.http(url, '$endpoint/$id'));

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return Produk.fromJson(json.decode(response.body)['data']);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Response> create(Produk produk) async {
    try {
      var response = await post(Uri.http(url, endpoint),
          headers: {"Content-type": "application/json"},
          body: produk.toRawJson());

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Response> update(Produk produk) async {
    try {
      var response = await put(Uri.http(url, '$endpoint/${produk.id_produk}'),
          headers: {"Content-type": "application/json"},
          body: produk.toRawJson());

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
