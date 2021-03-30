import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logindemo/Common.dart';

import 'HomePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:signalr_client/signalr_client.dart';

Future<Album> fetchAlbum(String ip, String user, String pass) async {
  Common.ServerUrl = ip;
  final response =
      //await http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));
      await http.post(Uri.https(ip, 'api/account/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body:
              jsonEncode(<String, String>{"Username": user, "Password": pass}));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({@required this.userId, @required this.id, @required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  Album futureAlbumtest;

  @override
  Widget build(BuildContext context) {
    var ipserver = TextEditingController();
    var userText = TextEditingController();
    var passText = TextEditingController();
    ipserver.text = "192.168.31.37:5001";
    userText.text = "admin";
    passText.text = "password";
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.only(top: 60.0),
            //   child: Center(
            //     child: Container(
            //         width: 200,
            //         height: 150,
            //         /*decoration: BoxDecoration(
            //                 color: Colors.red,
            //                 borderRadius: BorderRadius.circular(50.0)),*/
            //         child: Image.asset('asset/images/flutter-logo.png')),
            //   ),
            // ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                //192.168.31.37:5001
                controller: ipserver,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'IP Address'),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: userText,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passText,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            FlatButton(onPressed: () {
              //TODO FORGOT PASSWORD SCREEN GOES HERE
            }),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () async {
                  futureAlbumtest = await fetchAlbum(
                      ipserver.text, userText.text, passText.text);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => HomePage(futureAlbumtest)));
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Text('New User? Create Account')
          ],
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
