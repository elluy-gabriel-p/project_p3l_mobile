import 'dart:typed_data';
import 'dart:convert';

class LoginModel {
  final int status;
  final String message;
  final User data;

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
        data: User.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class User {
  final int? id;
  int? saldo, jumlah_poin;
  DateTime? ulang_tahun;

  String? nama_customer, email, password;
  // Uint8List? profilePicture;

  User(
      {this.id,
      this.nama_customer,
      this.email,
      this.ulang_tahun,
      this.saldo,
      this.password,
      this.jumlah_poin});
  // this.profilePicture});

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));
  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      nama_customer: json["nama_customer"],
      email: json["email"],
      ulang_tahun: json["ulang_tahun"],
      saldo: json["saldo"],
      password: json["password"],
      jumlah_poin: json["jumlah_poin"]);
  // profilePicture: base64Decode(json["profilePicture"]));

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_customer": nama_customer,
        "email": email,
        "ulang_tahun": ulang_tahun,
        "saldo": saldo,
        "password": password,
        "jumlah_poin": jumlah_poin,
        // "profilePicture":
        //     base64EncodeWithPadding(profilePicture ?? Uint8List(0)),
      };

  String base64EncodeWithPadding(Uint8List bytes) {
    return base64.encode(bytes).replaceAll('/', '_').replaceAll('+', '-');
  }
}
