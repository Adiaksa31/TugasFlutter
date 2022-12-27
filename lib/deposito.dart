import 'package:flutter/material.dart';
import 'package:flutter_application_tugas/services/user_services.dart';

class Deposito extends StatefulWidget {
  const Deposito({super.key});

  @override
  State<Deposito> createState() => _DepositoState();
}

class _DepositoState extends State<Deposito> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Setor'),
        //   centerTitle: true,
        // ),
        // body: SafeArea(
        //   child: Column(
        //     children: [
        //       Expanded(
        //         flex: 8,
        //         child: Column(
        //           children: [
        //             TextField(
        //               keyboardType: TextInputType.number,
        //               controller: jumlahSetoranController,
        //               decoration: InputDecoration(labelText: "Jumlah Penyetoran"),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Expanded(
        //         flex: 1,
        //         child: ElevatedButton(
        //           onPressed: () {
        //             confirmDialog(
        //                 widget.user.user_id, jumlahSetoranController.text);
        //           },
        //           child: Text('Setor'),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
