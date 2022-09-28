import 'package:flutter/material.dart';
import 'package:flutter_application_tugas/main.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    // color: Colors.white,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 204, 202, 202),
                          // spreadRadius: 5,
                          offset: Offset(1, 3), // changes position of shadow
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              child: Image.asset(
                                "img/1.jpg",
                                height: 100,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              width: 200,
                              child: Card(
                                color: Colors.blue,
                                child: Column(children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 200,
                                          padding:
                                              EdgeInsets.fromLTRB(10, 5, 0, 0),
                                          child: Text(
                                            "Nasabah",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          padding:
                                              EdgeInsets.fromLTRB(10, 0, 0, 5),
                                          child:
                                              Text("Kadek Adiaksa Widya Putra"),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            Container(
                              width: 200,
                              child: Card(
                                color: Colors.blue,
                                child: Column(children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 200,
                                          padding:
                                              EdgeInsets.fromLTRB(10, 5, 0, 0),
                                          child: Text(
                                            "Total Saldo Anda",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          padding:
                                              EdgeInsets.fromLTRB(10, 0, 0, 5),
                                          child: Text("Rp 100.000.000.000"),
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
                  height: 49,
                ),
                Container(
                    color: Color.fromARGB(255, 92, 115, 122),
                    width: 600,
                    height: 40,
                    child: Center(
                        child: Text(
                      "copyright @2022 by Undiksha",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
