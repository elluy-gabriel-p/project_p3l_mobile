import 'dart:convert';

class BahanBaku {
  final int? id_bahan_baku;

  int? stok_bahan;
  String? nama_bahan, satuan;

  BahanBaku({
    required this.id_bahan_baku,
    required this.stok_bahan,
    required this.nama_bahan,
    required this.satuan,
  });

  factory BahanBaku.fromRawJson(String str) =>
      BahanBaku.fromJson(json.decode(str));
  factory BahanBaku.fromJson(Map<String, dynamic> json) => BahanBaku(
        id_bahan_baku: json["id_bahan_baku"],
        stok_bahan: json["stok_bahan"],
        nama_bahan: json["nama_bahan"],
        satuan: json["satuan"],
      );

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "id_bahan_baku": id_bahan_baku,
        "stok_bahan": stok_bahan,
        "nama_bahan": nama_bahan,
        "satuan": satuan,
      };
}
