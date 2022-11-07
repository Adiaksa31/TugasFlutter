import 'package:flutter/material.dart';
import 'package:flutter_application_tugas/services/user_services.dart';


class Pinjaman extends StatefulWidget {
  @override
  State<Pinjaman> createState() => _PinjamanState();
}

class _PinjamanState extends State<Pinjaman> {
  //2. buat fungsi get data user
  getUsers() async {
    UserService _service = UserService();
    await _service.getdata().then((value) {
      setState(() {
        // _listUser = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 145, 141, 141),
        title: Text('Halaman Pinjaman'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: getUsers(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(snapshot.data[index]['avatar']),
                          ),
                          title: Text(snapshot.data[index]['first_name'] +
                              " " +
                              snapshot.data[index]['last_name']),
                          subtitle: Text(snapshot.data[index]['email']),
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
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
}
