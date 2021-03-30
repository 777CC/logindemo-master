import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:logindemo/EventLog.dart';
import 'package:signalr_client/signalr_client.dart';

import 'Common.dart';
import 'detail_page.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  final Album futureAlbumtest;
  const HomePage(this.futureAlbumtest);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedItem;
  @override
  void initState() {
    super.initState();
    final hubConnection = HubConnectionBuilder()
        .withUrl("https://" + Common.ServerUrl + "/OperatorHub")
        .build();
    // When the connection is closed, print out a message to the console.
    hubConnection.onclose((error) => print("Connection Closed"));
    hubConnection.start();
    hubConnection.on("Alarm", _handleAClientProvidedFunction);
  }

  @override
  Widget build(BuildContext context) {
    final items =
        List<String>.generate(10000, (i) => "$i (ชื่อเล่น)ชื่อ นามสกุล");
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('รายการ'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(Icons.person),
                  selected: items[index] == selectedItem,
                  title: Text(items[index]),
                  onTap: () {
                    setState(() {
                      selectedItem = items[index];

                      // To remove the previously selected detail page
                      // while (Navigator.of(context).canPop()) {
                      //   Navigator.of(context).pop();
                      // }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(item: selectedItem)),
                      );

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) {
                      //     return DetailPage(item: selectedItem);
                      //   }),
                      // );
                      // Navigator.of(context)
                      //     .push(DetailRoute(builder: (context) {
                      //   return DetailPage(item: selectedItem);
                      // }));
                    });
                  });
            }));
  }

  void _handleAClientProvidedFunction(List<Object> parameters) {
    //logger.log(LogLevel.Information, "Server invoked the method");
    //print(eventLogJson);

    // print(parameters.length);
    // for (Object element in parameters) {
    //   print(element.toString());
    // }

    if (parameters.length == 3) {
      //final parsed =
      final json = jsonDecode(parameters[2]);
      print(json);
      EventLog log = EventLog.fromJson(json);
      print(log.type.displayName);
    }
  }
}
