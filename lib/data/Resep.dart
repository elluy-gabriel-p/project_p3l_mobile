import 'dart:convert';

class Resep {
  final int? id_resep;

  String? nama_resep;
  int? kuota_harian;

  Resep(
      {required this.id_resep,
      required this.nama_resep,
      required this.kuota_harian});

  factory Resep.fromRawJson(String str) => Resep.fromJson(json.decode(str));
  factory Resep.fromJson(Map<String, dynamic> json) => Resep(
      id_resep: json["id_resep"],
      nama_resep: json["nama_resep"],
      kuota_harian: json["kuota_harian"]);

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "id_resep": id_resep,
        "nama_resep": nama_resep,
        "kuota_harian": kuota_harian
      };
}
