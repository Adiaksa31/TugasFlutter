import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tugas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(widget.title),
      )),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
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
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        // spreadRadius: 5,
                        offset: Offset(-3, -3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            hintText: "Email"),
                      ),
                      Container(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()));
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
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                ),
                Container(
                    color: Color.fromARGB(255, 86, 88, 84),
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
