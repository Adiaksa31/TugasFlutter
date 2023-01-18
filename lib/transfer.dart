import 'package:flutter/material.dart';
import 'package:flutter_application_tugas/model/user.dart';
import 'package:flutter_application_tugas/services/user_services.dart';

class Transfer extends StatefulWidget {
  final ListUsersModel user;
  const Transfer({super.key, required this.user});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  List<ListUsersModel> _listUser = [];
  bool tranferLoading = false;

  getUsers() async {
    ListUsersService _service = ListUsersService();
    await _service.getDataUsers().then(
      (value) {
        setState(
          () {
            _listUser = value!;
            tranferLoading = false;
          },
        );
      },
    );
  }

  tranferSaldo(
      int user_id, String jumlah_transfer, String nomor_rekening) async {
    ListUsersService _service = ListUsersService();
    await _service.transfer(
        user_id, double.parse(jumlah_transfer), nomor_rekening);
  }

  // tarikSaldo(String? user_id, String jumlah_transfer) async {
  //   ListUsersService _service = ListUsersService();
  //   await _service.tarikSaldo(
  //       int.parse(user_id!), double.parse(jumlah_transfer));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: getUsers, icon: Icon(Icons.assignment_ind_outlined))
        ],
        title: Text('Transfer'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<ListUsersModel>?>(
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: _listUser.length,
                    itemBuilder: (context, index) {
                      ListUsersModel data = _listUser[index];
                      return listTileUser(
                          data.userId!.toString(),
                          data.saldo,
                          data.username!,
                          Colors.blue,
                          data.saldo!,
                          Colors.grey.shade100,
                          data.nama.toString());
                    });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget listTileUser(String id, String? saldo, String subtitle, Color color,
      String nilai, Color bgColor, String nama) {
    return ListTile(
      isThreeLine: true,
      title: Text(nama,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      subtitle: Text(subtitle + '\n' + saldo.toString()),
      trailing: IconButton(
          onPressed: () {
            transferDialog(nama, int.parse(widget.user.userId!));
          },
          icon: Icon(Icons.attach_money_outlined)),
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

  transferDialog(String nama, int id) {
    TextEditingController jumlahTransferController = TextEditingController();
    TextEditingController nomorRekeningController = TextEditingController();
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Batal'),
          ),
          (tranferLoading)
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      tranferLoading = true;
                    });
                    // await tarikSaldo(
                    //     widget.user.userId, jumlahTransferController.text);
                    await tranferSaldo(id, jumlahTransferController.text,
                        nomorRekeningController.text);
                    getUsers();

                    Navigator.pop(context);
                  },
                  child: Text('Transfer'),
                ),
        ],
        title: Text('Transfer to $nama'),
        content: Column(
          children: [
            Container(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Jumlah transfer",
                    ),
                    controller: jumlahTransferController,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Nomor rekening",
                    ),
                    controller: nomorRekeningController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
