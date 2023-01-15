import 'package:dio/dio.dart';
import 'package:flutter_application_tugas/model/user.dart';

class ListUsersService {
  Dio dio = Dio();
  Future<List<ListUsersModel>?> getDataUsers() async {
    String url = "http://apikoperasi.rey1024.com/users";
    final Response response;
    try {
      response = await dio.get(
        url,
      );
      // print(response.data);
      if (response.statusCode == 200) {
        var json = response.data;
        //boleh dipakai sesuai kondisi data json
        if (json is Map && json.keys.contains('data')) {
          var data = json['data'];
          if (data is List) {
            return data
                .map<ListUsersModel>((u) => ListUsersModel.fromJson(u))
                .toList();
          }
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }
  // postLogin(String username, String password) async {
  //   String url = 'https://koperasiundiksha.000webhostapp.com';
  //   Dio dio = Dio();
  //   final Response response;
  //   FormData formData =
  //       FormData.fromMap({"username": username, "password": password});
  //   try {
  //     // dio.options.headers['Authentication']
  //     response = await dio.post(url, data: formData);
  //     print(response.data);
  //     // print(response.data[0]["nama"]);
  //     if (response.statusCode == 200) {
  //       final data = response.data;
  //       return ListUsersModel(
  //         userId: data["user_id"],
  //         username: data["username"],
  //         password: data["password"],
  //         nama: data["nama"],
  //         saldo: data["saldo"],
  //       );
  //       // return true;
  //     }
  //   } catch (e) {}
  // }

  postLogin(String username, String password) async {
    String url = 'http://apikoperasi.rey1024.com';
    final Response response;
    FormData formData =
        FormData.fromMap({"username": username, "password": password});

    response = await dio.post(
      url,
      data: formData,
    );
    if (response.data['status'] == "success") {
      final data = response.data;
      return ListUsersModel(
        userId: data['data'][0]['user_id'],
        username: username,
        password: password,
        nama: data['data'][0]['nama'],
        saldo: data['data'][0]['saldo'],
        nomor_rekening: data[0]['nomor_rekening'],
      );
    } else {
      return print("gagal");
    }
  }

  postRegister(String username, String password, String nama) async {
    String url = 'http://apikoperasi.rey1024.com/register';
    final Response response;
    FormData formData = FormData.fromMap(
        {"username": username, "password": password, "nama": nama});
    response = await dio.post(
      url,
      data: formData,
    );
    if (response.data['status'] ==
        "Data berhasil disimpan, saldo awal 50.000") {
      print('Berhasil');
    } else {
      print(response.data);
    }
  }

  transfer(int user_id, double jumlah_setoran) async {
    String url = 'http://apikoperasi.rey1024.com/setoran';
    final Response response;
    FormData formData = FormData.fromMap(
        {"user_id": user_id, "jumlah_setoran": jumlah_setoran});
    try {
      response = await dio.post(url, data: formData);
      print('berhasil');
    } catch (e) {
      print('gagal');
    }
  }

  tarikSaldo(int user_id, double jumlah_tarikan) async {
    String url = 'http://apikoperasi.rey1024.com/tarikan';
    final Response response;
    FormData formData = FormData.fromMap(
        {"user_id": user_id, "jumlah_tarikan": jumlah_tarikan});
    try {
      response = await dio.post(url, data: formData);
      print('berhasil');
    } catch (e) {
      print('gagal');
    }
  }
}
