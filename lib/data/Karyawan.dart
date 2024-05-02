import 'dart:typed_data';
import 'dart:convert';

class LoginModel {
  final int status;
  final String message;
  final Karyawan data;

  const LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromRawJson(String str) =>
      LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: Karyawan.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Karyawan {
  final int? id;
  int? honor_harian, bonus;

  String? nama_karyawan, password;
  // Uint8List? profilePicture;

  Karyawan(
      {this.id,
      this.nama_karyawan,
      this.honor_harian,
      this.password,
      this.bonus});
  // this.profilePicture});

  factory Karyawan.fromRawJson(String str) =>
      Karyawan.fromJson(json.decode(str));
  factory Karyawan.fromJson(Map<String, dynamic> json) => Karyawan(
      id: json["id"],
      nama_karyawan: json["nama_karyawan"],
      honor_harian: json["honor_harian"],
      password: json["password"],
      bonus: json["bonus"]);
  // profilePicture: base64Decode(json["profilePicture"]));

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_karyawan": nama_karyawan,
        "honor_harian": honor_harian,
        "password": password,
        "bonus": bonus,
        // "profilePicture":
        //     base64EncodeWithPadding(profilePicture ?? Uint8List(0)),
      };

  String base64EncodeWithPadding(Uint8List bytes) {
    return base64.encode(bytes).replaceAll('/', '_').replaceAll('+', '-');
  }
}
