import 'package:flutter/material.dart';
import 'package:flutter_application_tugas/main.dart';
import 'package:flutter_application_tugas/model/user.dart';
import 'package:flutter_application_tugas/services/user_services.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  late String Username = '';
  late String Password = '';
  late String nama = '';
  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final myAppBar = AppBar(
        title: Center(
      child: Text('Register'),
    ));

    final bodyHeight = MediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final bool islandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: myAppBar,
      body: SingleChildScrollView(
          child: (islandscape)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(50),
                      child: Image.asset(
                        "img/2.png",
                        height: MediaQueryHeight * 0.4,
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
                            onChanged: (value) {
                              nama = value;
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                hintText: "Masukkan Nama"),
                          ),
                          Container(
                            height: MediaQueryHeight * 0.01,
                          ),
                          TextField(
                            onChanged: (value) {
                              Username = value;
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                hintText: "Masukkan Email"),
                          ),
                          Container(
                            height: MediaQueryHeight * 0.01,
                          ),
                          TextField(
                            obscureText: true,
                            onChanged: (value) {
                              Password = value;
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                hintText: "Masukkan Password"),
                          ),
                          Container(
                            height: MediaQueryHeight * 0.03,
                          ),
                          Container(
                            // color: Colors.grey,
                            alignment: Alignment.center,
                            child: Container(
                              width: MediaQueryWidth * 0.2,
                              height: MediaQueryHeight * 0.1,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 49, 49, 49),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () async {
                                  ListUsersService _service =
                                      ListUsersService();
                                  ListUsersModel user = await _service
                                      .postRegister(Username, Password, nama);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyApp()),
                                  );
                                  setState(() {});
                                  // Navigator.pushReplacement(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => Home(),
                                  //   ),
                                  // );

                                  // if (getUser.text == '' &&
                                  //     getPass.text == '') {
                                  //   Navigator.pushReplacement(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => home()));
                                  // } else {
                                  //   showDialog(
                                  //       context: context,
                                  //       builder: (BuildContext context) {
                                  //         return alert;
                                  //       });
                                  // }
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
                            height: MediaQueryHeight * 0.01,
                          ),
                          Container(
                            height: MediaQueryHeight * 0.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQueryHeight * 0.085,
                    ),
                    Container(
                        color: Color.fromARGB(255, 92, 115, 122),
                        width: double.infinity,
                        height: MediaQueryHeight * 0.1,
                        child: Center(
                            child: Text(
                          "copyright @2022 by Undiksha",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ))),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(50),
                      child: Image.asset(
                        "img/2.png",
                        height: MediaQueryHeight * 0.3,
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
                            onChanged: (value) {
                              nama = value;
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                hintText: "Masukkan Nama"),
                          ),
                          Container(
                            height: MediaQueryHeight * 0.01,
                          ),
                          TextField(
                            onChanged: (value) {
                              Username = value;
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                hintText: "Masukkan Email"),
                          ),
                          Container(
                            height: MediaQueryHeight * 0.01,
                          ),
                          TextField(
                            obscureText: true,
                            onChanged: (value) {
                              Password = value;
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                hintText: "Masukkan Password"),
                          ),
                          Container(
                            height: MediaQueryHeight * 0.03,
                          ),
                          Container(
                            // color: Colors.grey,
                            alignment: Alignment.center,
                            child: Container(
                              width: MediaQueryWidth * 0.2,
                              height: MediaQueryHeight * 0.04,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 49, 49, 49),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () async {
                                  ListUsersService _service =
                                      ListUsersService();
                                  ListUsersModel user = await _service
                                      .postRegister(Username, Password, nama);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyApp()),
                                  );
                                  setState(() {});
                                  // if (getUser.text == '' &&
                                  //     getPass.text == '') {
                                  //   Navigator.pushReplacement(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => home()));
                                  // } else {
                                  //   showDialog(
                                  //       context: context,
                                  //       builder: (BuildContext context) {
                                  //         return alert;
                                  //       });
                                  // }
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
                                  "Kirim",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 253, 253),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyApp(),
                                ),
                              );
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 106, 127, 247),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Container(
                            height: MediaQueryHeight * 0.01,
                          ),
                          Container(
                            height: MediaQueryHeight * 0.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQueryHeight * 0.085,
                    ),
                    Container(
                        color: Color.fromARGB(255, 92, 115, 122),
                        width: double.infinity,
                        height: MediaQueryHeight * 0.04,
                        child: Center(
                            child: Text(
                          "copyright @2022 by Undiksha",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ))),
                  ],
                )),
    );
  }
}
