import 'package:flutter/material.dart';
import 'package:flutter_application_tugas/model/user.dart';
import 'package:flutter_application_tugas/services/user_services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Transfer extends StatefulWidget {
  final ListUsersModel user;
  const Transfer({super.key, required this.user});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  List<ListUsersModel> _listUser = [];
  bool tranferLoading = false;
  int pajak = 1032;

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

  Pajak(int user_id, String jumlah_bayar) async {
    ListUsersService _service = ListUsersService();
    await _service.bayar(user_id, double.parse(jumlah_bayar));
  }

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

                    await tranferSaldo(id, jumlahTransferController.text,
                        nomorRekeningController.text);
                    Pajak(id, pajak.toString());

                    getUsers();
                    showNotification();

                    Navigator.pop(context);
                  },
                  child: Text('Transfer'),
                ),
        ],
        title: Text('Transfer to $nama'),
        content: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text("Pajak Transfer Rp. 1032"),
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

  showNotification() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high channel',
      'Very important notification!!',
      description: 'the first notification',
      importance: Importance.max,
    );
//
    await flutterLocalNotificationsPlugin.show(
      1,
      'Bank Undiksha',
      'Berhasil Transfer Saldo',
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description),
      ),
    );
  }
}
