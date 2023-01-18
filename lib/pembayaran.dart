import 'package:flutter/material.dart';
import 'package:flutter_application_tugas/model/user.dart';
import 'package:flutter_application_tugas/services/user_services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Pembayaran extends StatefulWidget {
  final ListUsersModel user;
  const Pembayaran({super.key, required this.user});

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  final TextEditingController jumlahPembayaranController =
      TextEditingController();

  confirmDialog(String? user_id, String jumlah_bayar) {
    showDialog(
      context: (context),
      builder: (_) => AlertDialog(
        title: Text('Are You Sure?'),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await bayar(user_id, jumlah_bayar);
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
                    controller: jumlahPembayaranController,
                    decoration: InputDecoration(labelText: "Jumlah Pembayaran"),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  confirmDialog(
                      widget.user.userId, jumlahPembayaranController.text);
                  showNotification();
                },
                child: Text('Bayar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bayar(String? user_id, String jumlah_bayar) async {
    ListUsersService _service = ListUsersService();
    await _service.bayar(int.parse(user_id!), double.parse(jumlah_bayar));
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

    await flutterLocalNotificationsPlugin.show(
      1,
      'Bank Undiksha',
      'Berhasil Melakukan Pembayaran',
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description),
      ),
    );
  }
}
