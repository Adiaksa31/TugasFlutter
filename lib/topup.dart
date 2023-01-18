import 'package:flutter/material.dart';
import 'package:flutter_application_tugas/services/user_services.dart';
import 'package:flutter_application_tugas/model/user.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Topup extends StatefulWidget {
  final ListUsersModel user;
  const Topup({super.key, required this.user});

  @override
  State<Topup> createState() => _TopupState();
}

class _TopupState extends State<Topup> {
  final TextEditingController jumlahTopupController = TextEditingController();

  confirmDialog(String? user_id, String jumlah_topup) {
    showDialog(
      context: (context),
      builder: (_) => AlertDialog(
        title: Text('Are You Sure?'),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await topup(int.parse(user_id!), jumlah_topup);
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
        title: Text('Top Up Saldo'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: jumlahTopupController,
                      decoration: InputDecoration(labelText: "Jumlah Topup"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  confirmDialog(widget.user.userId, jumlahTopupController.text);
                  showNotification();
                  // tarikSaldo(
                  //     widget.user.user_id, jumlahTopupController.text);
                },
                child: Text('Kirim'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  topup(int user_id, String jumlah_topup) async {
    ListUsersService _service = ListUsersService();
    await _service.topup(user_id, double.parse(jumlah_topup));
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
      'Berhasil TopUp Saldo',
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description),
      ),
    );
  }
}
