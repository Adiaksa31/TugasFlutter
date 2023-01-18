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
      if (response.statusCode == 200) {
        var json = response.data;
        if (json is List) {
          return json
              .map<ListUsersModel>((u) => ListUsersModel.fromJson(u))
              .toList();
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  Saldo(int user_id) async {
    String url = 'http://apikoperasi.rey1024.com/getsingleuser';
    final Response response;
    FormData formData = FormData.fromMap({"user_id": user_id});
    response = await dio.post(url, data: formData);
    if (response.statusCode == 200) {
      final data = response.data;
      print(data[0]['saldo']);
      return int.parse(data[0]['saldo']);
      // return print(response.statusCode);
    } else {
      return print('gagal');
    }
  }

  postLogin(String username, String password) async {
    String url = 'http://apikoperasi.rey1024.com';
    final Response response;
    FormData formData =
        FormData.fromMap({"username": username, "password": password});

    response = await dio.post(
      url,
      data: formData,
    );
    if (response.statusCode == 200) {
      final data = response.data;
      return ListUsersModel(
        userId: data[0]['user_id'],
        username: username,
        password: password,
        nama: data[0]['nama'],
        saldo: data[0]['saldo'],
        nomor_rekening: data[0]['nomor_rekening'],
      );
    } else {
      return print("gagal");
    }
  }

  postRegister(
      String username, String password, String nama, String nim) async {
    String url = 'http://apikoperasi.rey1024.com/register';
    final Response response;
    FormData formData = FormData.fromMap(
        {"username": username, "password": password, "nama": nama, "nim": nim});
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

  transfer(int user_id, double jumlah_transfer, String nomor_rekening) async {
    String url = 'http://apikoperasi.rey1024.com/transfer';
    final Response response;
    FormData formData = FormData.fromMap({
      "id_pengirim": user_id,
      "jumlah_transfer": jumlah_transfer,
      "nomor_rekening": nomor_rekening
    });
    try {
      print(user_id);
      print(jumlah_transfer);
      print(nomor_rekening);
      response = await dio.post(url, data: formData);
      print('berhasil');
    } catch (e) {
      print('gagal');
    }
  }

  bayar(int user_id, double jumlah_bayar) async {
    String url = 'http://apikoperasi.rey1024.com/tarikan';
    final Response response;
    FormData formData = FormData.fromMap(
        {"user_id": user_id, "jumlah_tarikan": jumlah_bayar});
    try {
      response = await dio.post(url, data: formData);
      print('berhasil');
    } catch (e) {
      print('gagal');
    }
  }

  topup(int user_id, double jumlah_topup) async {
    String url = 'http://apikoperasi.rey1024.com/setoran';
    final Response response;
    FormData formData = FormData.fromMap({
      "user_id": user_id,
      "jumlah_setoran": jumlah_topup,
    });
    try {
      response = await dio.post(url, data: formData);
      print('berhasil');
    } catch (e) {
      print('gagal');
    }
  }
}
