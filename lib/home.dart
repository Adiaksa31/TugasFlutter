import 'package:flutter/material.dart';
import 'package:flutter_application_tugas/cek_saldo.dart';
import 'package:flutter_application_tugas/deposito.dart';
import 'package:flutter_application_tugas/main.dart';
import 'package:flutter_application_tugas/mutasi.dart';
import 'package:flutter_application_tugas/pembayaran.dart';
import 'package:flutter_application_tugas/pinjaman.dart';
import 'package:flutter_application_tugas/transfer.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

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
        onPressed: () {},
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
                                height: MediaQueryHeight * 0.4,
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
                                          width: MediaQueryWidth * 0.8,
                                          height: MediaQueryHeight * 0.16,
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
                                                        "Kadek Adiaksa Widya Putra",
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
                                          width: MediaQueryWidth * 0.8,
                                          height: MediaQueryHeight * 0.16,
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
                                                        "Rp 100.000.000.000",
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
                              height: MediaQueryHeight * 0.38,
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
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height: MediaQueryHeight * 0.15,
                                        width: MediaQueryWidth * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Icon(Icons.wallet,
                                                  size: 50,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                            Container(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              CekSaldo()));
                                                },
                                                child: Text(
                                                  "Cek Saldo",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 7, 7, 7),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height: MediaQueryHeight * 0.15,
                                        width: MediaQueryWidth * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Icon(Icons.monetization_on,
                                                  size: 50,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                            Container(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Transfer()));
                                                },
                                                child: Text(
                                                  "Transfer",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 7, 7, 7),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height: MediaQueryHeight * 0.15,
                                        width: MediaQueryWidth * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Icon(Icons.money,
                                                  size: 50,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                            Container(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Deposito()));
                                                },
                                                child: Text(
                                                  "Deposit",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 7, 7, 7),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height: MediaQueryHeight * 0.15,
                                        width: MediaQueryWidth * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Icon(Icons.credit_card,
                                                  size: 50,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                            Container(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Pembayaran()));
                                                },
                                                child: Text(
                                                  "Pembayaran",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 7, 7, 7),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height: MediaQueryHeight * 0.15,
                                        width: MediaQueryWidth * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Icon(Icons.attach_money,
                                                  size: 50,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                            Container(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Pinjaman()));
                                                },
                                                child: Text(
                                                  "Pinjaman",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 7, 7, 7),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height: MediaQueryHeight * 0.15,
                                        width: MediaQueryWidth * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Icon(Icons.insert_chart,
                                                  size: 50,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                            Container(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Mutasi()));
                                                },
                                                child: Text(
                                                  "mutasi",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 7, 7, 7),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
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
                                                        "Kadek Adiaksa Widya Putra",
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
                                                          MediaQueryWidth * 0.6,
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 0, 0, 5),
                                                      child: Text(
                                                        "Rp 100.000.000.000",
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
                              height: MediaQueryHeight * 0.35,
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
                                  padding: EdgeInsets.all(0),
                                  crossAxisCount: 3,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height: MediaQueryHeight * 0.15,
                                        width: MediaQueryWidth * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Icon(Icons.wallet,
                                                  size: 50,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                            Container(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              CekSaldo()));
                                                },
                                                child: Text(
                                                  "Cek Saldo",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 7, 7, 7),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height: MediaQueryHeight * 0.15,
                                        width: MediaQueryWidth * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Icon(Icons.monetization_on,
                                                  size: 50,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                            Container(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Transfer()));
                                                },
                                                child: Text(
                                                  "Transfer",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 7, 7, 7),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height: MediaQueryHeight * 0.15,
                                        width: MediaQueryWidth * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Icon(Icons.money,
                                                  size: 50,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                            Container(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Deposito()));
                                                },
                                                child: Text(
                                                  "Deposit",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 7, 7, 7),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height: MediaQueryHeight * 0.15,
                                        width: MediaQueryWidth * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Icon(Icons.credit_card,
                                                  size: 50,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                            Container(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Pembayaran()));
                                                },
                                                child: Text(
                                                  "Pembayaran",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 7, 7, 7),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height: MediaQueryHeight * 0.15,
                                        width: MediaQueryWidth * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Icon(Icons.attach_money,
                                                  size: 50,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                            Container(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Pinjaman()));
                                                },
                                                child: Text(
                                                  "Pinjaman",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 7, 7, 7),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height: MediaQueryHeight * 0.15,
                                        width: MediaQueryWidth * 0.25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Icon(Icons.insert_chart,
                                                  size: 50,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                            Container(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Mutasi()));
                                                },
                                                child: Text(
                                                  "mutasi",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 7, 7, 7),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
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
