import 'package:flutter/material.dart';
import 'package:flutter_application_tugas/model/user.dart';
import 'package:flutter_application_tugas/services/user_services.dart';

class Pembayaran extends StatefulWidget {
  final ListUsersModel user;
  const Pembayaran({super.key, required this.user});

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  final TextEditingController jumlahPenarikanController =
      TextEditingController();

  confirmDialog(String? user_id, String jumlah_setoran) {
    showDialog(
      context: (context),
      builder: (_) => AlertDialog(
        title: Text('Are You Sure?'),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await tarikSaldo(user_id, jumlah_setoran);
              Navigator.pop(context);
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  TextField(
                    controller: jumlahPenarikanController,
                    decoration: InputDecoration(labelText: "Jumlah Penarikan"),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  confirmDialog(
                      widget.user.userId, jumlahPenarikanController.text);
                  // tarikSaldo(
                  //     widget.user.user_id, jumlahPenarikanController.text);
                },
                child: Text('Tarik'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  tarikSaldo(String? user_id, String jumlah_tarikan) async {
    ListUsersService _service = ListUsersService();
    await _service.tarikSaldo(
        int.parse(user_id!), double.parse(jumlah_tarikan));
  }
}
