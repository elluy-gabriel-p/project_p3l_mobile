import 'dart:convert';

class Hampers {
  final int? id_hampers;

  DateTime? tgl_mulai_promo, tgl_akhir_promo;
  String? nama_hampers, gambar_hampers, deskripsi_hampers;
  int? harga_hampers;

  Hampers(
      {required this.id_hampers,
      required this.tgl_mulai_promo,
      required this.tgl_akhir_promo,
      required this.nama_hampers,
      required this.deskripsi_hampers,
      required this.gambar_hampers,
      required this.harga_hampers});

  factory Hampers.fromRawJson(String str) => Hampers.fromJson(json.decode(str));
  factory Hampers.fromJson(Map<String, dynamic> json) => Hampers(
      id_hampers: json["id_hampers"],
      tgl_mulai_promo: DateTime.parse(json["tgl_mulai_promo"]),
      tgl_akhir_promo: DateTime.parse(json["tgl_akhir_promo"]),
      nama_hampers: json["nama_hampers"],
      deskripsi_hampers: json["deskripsi_hampers"],
      gambar_hampers: json["gambar_hampers"],
      harga_hampers: json["harga_hampers"]);

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "id_hampers": id_hampers,
        "tgl_mulai_promo": tgl_mulai_promo,
        "tgl_akhir_promo": tgl_akhir_promo,
        "nama_hampers": nama_hampers,
        "deskripsi_hampers": deskripsi_hampers,
        "gambar_hampers": gambar_hampers,
        "harga_hampers": harga_hampers
      };
}
