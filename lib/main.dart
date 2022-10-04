import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_tugas/home.dart';

void main() {
  runApp(const MyApp());
}

TextEditingController getUser = new TextEditingController();
TextEditingController getPass = new TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tugas',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Koperasi Undiksha'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AlertDialog alert = AlertDialog(
    title: Text('Login Failed'),
    content: Text('Try to Check your Username or Password'),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          title: Center(
        child: Text(widget.title),
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 20,
            ),
            Container(
              child: Image.asset(
                "img/undiksha.jpg",
                height: 150,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 0, 20),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              // color: Colors.white,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 145, 141, 141),
                    // spreadRadius: 5,
                    offset: Offset(-3, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextField(
                    controller: getUser,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        hintText: "Email"),
                  ),
                  Container(
                    height: 10,
                  ),
                  TextField(
                    obscureText: true,
                    controller: getPass,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        hintText: "Password"),
                  ),
                  Container(
                    height: 30,
                  ),
                  Container(
                    // color: Colors.grey,
                    alignment: Alignment.center,
                    child: Container(
                      width: 150,
                      height: 40,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 49, 49, 49),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          if (getUser.text == 'adi@gmail.com' &&
                              getPass.text == '2015051032') {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => home()));
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alert;
                                });
                          }
                          // String user = '123';
                          // String pass = '123';

                          // if (getUser.text.length == 0) {
                          //   final errorUser = SnackBar(
                          //     content: Text('Username tidak boleh kosong!'),
                          //     duration: Duration(seconds: 2),
                          //   );
                          // } else if (getPass.text.length == 0) {
                          //   final errorUser = SnackBar(
                          //     content: Text('Password tidak boleh kosong!'),
                          //     duration: Duration(seconds: 2),
                          //   );
                          // } else if (getUser.text == user &&
                          //     getPass.text == pass) {
                          //   final errorUser = SnackBar(
                          //     content: Text(
                          //         'Selamat datang user: ' + getUser.text),
                          //     duration: Duration(seconds: 2),
                          //   );

                          //   delay to Home page
                          //   Timer(Duration(seconds: 0), () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => home()));
                          //   });
                          // } else {
                          //   final errorUser = SnackBar(
                          //     content: Text('Cek kembali input anda!'),
                          //     duration: Duration(seconds: 2),
                          //   );
                          // }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 253, 253),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Daftar Mbangking",
                            style: TextStyle(
                                color: Color.fromARGB(255, 106, 127, 247),
                                fontSize: 10,
                                fontWeight: FontWeight.w900),
                          ),
                          Container(
                            width: 20,
                          ),
                          Text(
                            "Lupa Password?",
                            style: TextStyle(
                                color: Color.fromARGB(255, 106, 127, 247),
                                fontSize: 10,
                                fontWeight: FontWeight.w900),
                          )
                        ]),
                  ),
                  Container(
                    height: 5,
                  ),
                ],
              ),
            ),
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
    );
  }
}
