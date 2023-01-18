import 'package:flutter/material.dart';
import 'package:flutter_application_tugas/bar_code.dart';
import 'package:flutter_application_tugas/deposito.dart';
import 'package:flutter_application_tugas/main.dart';
import 'package:flutter_application_tugas/model/user.dart';
import 'package:flutter_application_tugas/pembayaran.dart';
import 'package:flutter_application_tugas/topup.dart';
import 'package:flutter_application_tugas/services/user_services.dart';
import 'package:flutter_application_tugas/transfer.dart';

class home extends StatefulWidget {
  final ListUsersModel user;
  const home({Key? key, required this.user}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late int saldo = int.parse(widget.user.saldo.toString());
  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final myAppBar = AppBar(
      title: Center(
        child: Text("Koperasi Undiksha"),
      ),
      actions: <Widget>[
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                  child: InkWell(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp())),
                },
                child: Row(
                  children: <Widget>[Text("Logout")],
                ),
              ))
            ];
          },
          icon: Icon(Icons.logout, color: Color.fromARGB(255, 255, 255, 255)),
        )
      ],
    );
    final bool islandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: myAppBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Qrscanner()));
        },
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Icon(Icons.qr_code_scanner),
        ),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 179, 191, 197),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: (islandscape)
              ? Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                                height: MediaQueryHeight * 0.49,
                                padding: EdgeInsets.all(10),
                                width: double.infinity,
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 204, 202, 202),
                                      // spreadRadius: 5,
                                      offset: Offset(
                                          1, 3), // changes position of shadow
                                    ),
                                  ],
                                  border: Border.all(
                                      color: const Color(0xFF000000),
                                      style: BorderStyle.solid), //Border.all
                                  /*** The BorderRadius widget  is here ***/
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          child: Image.asset(
                                            "img/1.jpg",
                                            height: MediaQueryHeight * 0.4,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: MediaQueryWidth * 0.78,
                                          height: MediaQueryHeight * 0.2,
                                          child: Card(
                                            color: Color.fromARGB(
                                                255, 194, 196, 199),
                                            child: Column(children: [
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQueryWidth * 0.8,
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 5, 0, 0),
                                                      child: Text(
                                                        "Nasabah",
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQueryWidth * 0.8,
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 5, 0, 5),
                                                      child: Text(
                                                        widget.user.nama
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 17),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQueryWidth * 0.78,
                                          height: MediaQueryHeight * 0.2,
                                          child: Card(
                                            color: Color.fromARGB(
                                                255, 194, 196, 199),
                                            child: Column(children: [
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQueryWidth * 0.8,
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 5, 0, 0),
                                                      child: Text(
                                                        "Total Saldo Anda",
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQueryWidth * 0.8,
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 5, 0, 5),
                                                      child: Text(
                                                        widget.user.saldo
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 17),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )),
                            Container(
                              height: MediaQueryHeight * 0.01,
                            ),
                            Container(
                              height: MediaQueryHeight * 0.42,
                              padding: EdgeInsets.all(10),
                              width: double.infinity,
                              // color: Colors.white,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 204, 202, 202),
                                    // spreadRadius: 5,
                                    offset: Offset(
                                        1, 3), // changes position of shadow
                                  ),
                                ],
                                border: Border.all(
                                    color: const Color(0xFF000000),
                                    style: BorderStyle.solid), //Border.all
                                /*** The BorderRadius widget  is here ***/
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: GridView.count(
                                  padding: EdgeInsets.all(5),
                                  crossAxisCount: 6,
                                  children: <Widget>[
                                    icon(
                                        con: Icons.monetization_on,
                                        desc: 'Transfer',
                                        route: Transfer(
                                          user: widget.user,
                                        )),
                                    icon(
                                        con: Icons.payment,
                                        desc: 'Pembayaran',
                                        route: Pembayaran(user: widget.user)),
                                    icon(
                                        con: Icons.money,
                                        desc: 'TopUp Saldo',
                                        route: Topup(user: widget.user)),
                                  ]),
                            ),
                            Container(
                              height: MediaQueryHeight * 0.01,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        color: Color.fromARGB(255, 194, 196, 199),
                        width: MediaQueryWidth,
                        height: MediaQueryHeight * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQueryWidth * 0.5,
                                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                    child: Text(
                                      "Butuh Bantuan?",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQueryWidth * 0.5,
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      "0878-1234-1024",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Icon(Icons.phone,
                                  size: 50,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            ),
                          ],
                        )),
                    Container(
                      height: MediaQueryHeight * 0.1,
                    )
                  ],
                )
              : Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              width: MediaQueryWidth * 0.8,
                              child: Row(
                                children: [
                                  Container(
                                    width: MediaQueryWidth * 0.8,
                                    padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                    child: Text(
                                      "Saldo Anda",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQueryWidth * 0.00,
                                    child: IconButton(
                                        onPressed: () async {
                                          ListUsersService _service =
                                              ListUsersService();
                                          saldo = await _service.Saldo(
                                              int.parse(widget.user.userId
                                                  .toString()));
                                          print(saldo);
                                          setState(() {});
                                        },
                                        icon: Icon(Icons.refresh)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQueryWidth * 0.8,
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                              child: Text(
                                saldo.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                            Container(
                                height: MediaQueryHeight * 0.2,
                                padding: EdgeInsets.all(10),
                                width: double.infinity,
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 204, 202, 202),
                                      // spreadRadius: 5,
                                      offset: Offset(
                                          1, 3), // changes position of shadow
                                    ),
                                  ],
                                  border: Border.all(
                                      color: const Color(0xFF000000),
                                      style: BorderStyle.solid), //Border.all
                                  /*** The BorderRadius widget  is here ***/
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          child: Image.asset(
                                            "img/1.jpg",
                                            height: MediaQueryHeight * 0.2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: MediaQueryWidth * 0.6,
                                          height: MediaQueryHeight * 0.08,
                                          child: Card(
                                            color: Color.fromARGB(
                                                255, 194, 196, 199),
                                            child: Column(children: [
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQueryWidth * 0.6,
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 5, 0, 0),
                                                      child: Text(
                                                        "Nasabah",
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQueryWidth * 0.6,
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 0, 0, 5),
                                                      child: Text(
                                                        widget.user.nama
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 17),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQueryWidth * 0.6,
                                          height: MediaQueryHeight * 0.08,
                                          child: Card(
                                            color: Color.fromARGB(
                                                255, 194, 196, 199),
                                            child: Column(children: [
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQueryWidth * 0.6,
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 5, 0, 0),
                                                      child: Text(
                                                        "Nomor Rekening",
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQueryWidth * 0.6,
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 0, 0, 5),
                                                      child: Text(
                                                        widget
                                                            .user.nomor_rekening
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 17),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )),
                            Container(
                              height: MediaQueryHeight * 0.01,
                            ),
                            Container(
                              height: MediaQueryHeight * 0.17,
                              padding: EdgeInsets.all(5),
                              width: double.infinity,
                              // color: Colors.white,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 204, 202, 202),
                                    // spreadRadius: 5,
                                    offset: Offset(
                                        1, 3), // changes position of shadow
                                  ),
                                ],
                                border: Border.all(
                                    color: const Color(0xFF000000),
                                    style: BorderStyle.solid), //Border.all
                                /*** The BorderRadius widget  is here ***/
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: GridView.count(
                                  padding: EdgeInsets.all(5),
                                  crossAxisCount: 3,
                                  children: <Widget>[
                                    icon(
                                        con: Icons.monetization_on,
                                        desc: 'Transfer',
                                        route: Transfer(user: widget.user)),
                                    icon(
                                        con: Icons.payment,
                                        desc: 'Pembayaran',
                                        route: Pembayaran(user: widget.user)),
                                    icon(
                                        con: Icons.attach_money,
                                        desc: 'TopUp Saldo',
                                        route: Topup(user: widget.user)),
                                  ]),
                            ),
                            Container(
                              height: MediaQueryHeight * 0.01,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        color: Color.fromARGB(255, 194, 196, 199),
                        width: MediaQueryWidth,
                        height: MediaQueryHeight * 0.1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQueryWidth * 0.5,
                                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                    child: Text(
                                      "Butuh Bantuan?",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      "0878-1234-1024",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Icon(Icons.phone,
                                  size: 50,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            ),
                          ],
                        )),
                  ],
                )),
    );
  }
}

class icon extends StatelessWidget {
  const icon({
    Key? key,
    required this.con,
    required this.desc,
    required this.route,
  }) : super(key: key);

  final IconData con;
  final String desc;
  final route;

  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: MediaQueryHeight * 0.2,
        width: MediaQueryWidth * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              child: Icon(con, size: 48, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => route));
                },
                child: Text(
                  "$desc",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 7, 7, 7),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
