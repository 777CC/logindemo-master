import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:logindemo/EventLog.dart';
import 'package:signalr_client/signalr_client.dart';

import 'Common.dart';
import 'detail_page.dart';
import 'main.dart';
import 'package:flutter/src/widgets/async.dart' as state;

Future<List<EventLog>> getProjectDetails() async {
  final result =
      await Common.hubConnection.invoke("GetEventLogListNotComplete");
  Iterable list = result as Iterable;
  List<EventLog> eventList = List<EventLog>.from([]);
  list.forEach((i) {
    //print(i.runtimeType);
    //final enc = jsonEncode(i);
    //print(enc);
    //final json = jsonDecode(enc);
    //print(json.runtimeType);
    EventLog log = EventLog.fromJson(i);
    eventList.add(log);
    print(log.data);
  });
  return eventList;
//
  // EventLog log = EventLog();
  // log.data = 'Test';
  // List<EventLog> list = List<EventLog>.from([log]);
  // list.add(log);
  // return list;
}

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
    Common.hubConnection.on("EventAdded", _handleAClientProvidedFunction);
  }

  @override
  Widget build(BuildContext context) {
    final items =
        List<String>.generate(10000, (i) => "$i (ชื่อเล่น)ชื่อ นามสกุล");
    final Future<List<EventLog>> list = getProjectDetails();

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
        body: FutureBuilder<List<EventLog>>(
            future: list,
            builder: (context, projectSnap) {
              if (projectSnap.connectionState != state.ConnectionState.done ||
                  projectSnap.hasData == false) {
                //print('project snapshot data is: ${projectSnap.data}');
                return Container();
              }
              return ListView.builder(
                itemCount: projectSnap.data.length,
                itemBuilder: (context, index) {
                  EventLog eventLog = projectSnap.data[index];

                  return ListTile(
                      leading: Icon(Icons.person),
                      //selected: items[index] == selectedItem,
                      title: Text(eventLog.data != null ? eventLog.data : ""),
                      onTap: () {
                        setState(() async {
                          // To remove the previously selected detail page
                          // while (Navigator.of(context).canPop()) {
                          //   Navigator.of(context).pop();
                          // }

                          final isUpdate = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(item: eventLog)),
                          );
                          if (isUpdate == true) {
                            ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(
                                  SnackBar(content: Text("Success")));
                            //await Future.delayed(Duration(milliseconds: 1));
                            setState(() {});
                          }
                        });
                      });
                },
              );
            }));
  }

  void _handleAClientProvidedFunction(List<Object> parameters) {
    //logger.log(LogLevel.Information, "Server invoked the method");
    //print(eventLogJson);

    // print(parameters.length);
    // for (Object element in parameters) {
    //   print(element.toString());
    // }

    if (parameters.length == 1) {
      //final parsed =
      //print(parameters[0]);
      //final json = jsonDecode(parameters[0]);
      print(json.runtimeType);
      EventLog log = EventLog.fromJson(parameters[0]);
      print(log.type.displayName);
      setState(() {});
    }
  }
}
