class ListUsersModel {
  ListUsersModel({
    this.userId,
    this.username,
    this.password,
    this.nama,
    this.saldo,
  });

  String? userId;
  String? username;
  String? password;
  String? nama;
  int? saldo;

  factory ListUsersModel.fromJson(Map<String, dynamic> json) => ListUsersModel(
        userId: json["user_id"],
        username: json["username"],
        password: json["password"],
        nama: json["nama"],
        saldo: json["saldo"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "password": password,
        "nama": nama,
        "saldo": saldo,
      };
}
