import 'package:flutter/material.dart';
import 'package:flutter_application_tugas/services/user_services.dart';
import 'package:flutter_application_tugas/model/user.dart';

class Pinjaman extends StatefulWidget {
  @override
  State<Pinjaman> createState() => _PinjamanState();
}

class _PinjamanState extends State<Pinjaman> {
  //2. buat fungsi get data user
  List<ListUsersModel> _listUser = [];

  //2. buat fungsi get data user
  getUsers() async {
    ListUsersService _service = ListUsersService();
    await _service.getDataUsers().then((value) {
      setState(() {
        _listUser = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                getUsers();
              },
              child: Text(
                'Lihat Data',
                style: TextStyle(fontSize: 50),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _listUser.length,
                  itemBuilder: (context, index) {
                    ListUsersModel data = _listUser[index];
                    return cardlist(data.userId!.toString(), data.nama!,
                        Colors.red, data.nama!, Colors.grey.shade100);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardlist(
      String title, String subtitle, Color color, String nilai, Color bgColor) {
    return Card(
      color: bgColor,
      child: ListTile(
        title: Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Text(subtitle),
        trailing: Container(
          height: 50,
          width: 50,
          color: color,
          child: Center(
            child: Text(nilai,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  Widget gridText(String nilai) {
    return Center(
      child: Text(
        nilai,
        style: const TextStyle(
          fontSize: 60,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
  
}
