import 'dart:convert';

class Produk {
  final int? id_produk;

  int? id_hampers, id_resep, id_penitip;
  String? nama_produk, tipe_produk, gambar_produk, deskripsi_produk;
  int? harga, jumlah_stok;
  double? porsi;

  Produk({
    required this.id_produk,
    required this.id_hampers,
    required this.id_resep,
    required this.id_penitip,
    required this.nama_produk,
    required this.tipe_produk,
    required this.harga,
    required this.jumlah_stok,
    required this.deskripsi_produk,
    required this.porsi,
    required this.gambar_produk,
  });

  factory Produk.fromRawJson(String str) => Produk.fromJson(json.decode(str));
  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
        id_produk: json["id_produk"],
        id_hampers: json["id_hampers"],
        id_resep: json["id_resep"],
        id_penitip: json["id_penitip"],
        nama_produk: json["nama_produk"],
        tipe_produk: json["tipe_produk"],
        harga: json["harga"],
        jumlah_stok: json["jumlah_stok"],
        deskripsi_produk: json["deskripsi_produk"],
        gambar_produk: json["gambar_produk"],
        porsi: json["porsi"].toDouble(),
      );

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "id_produk": id_produk,
        "id_hampers": id_hampers,
        "id_resep": id_resep,
        "id_penitip": id_penitip,
        "nama_produk": nama_produk,
        "tipe_produk": tipe_produk,
        "harga": harga,
        "jumlah_stok": jumlah_stok,
        "deskripsi_produk": deskripsi_produk,
        "gambar_produk": gambar_produk,
        "porsi": porsi
      };
}
