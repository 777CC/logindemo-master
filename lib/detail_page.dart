import 'package:flutter/material.dart';

import 'Common.dart';
import 'EventLog.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key key, @required this.item}) : super(key: key);

  final EventLog item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ข้อมูลนักเรียน"),
          // leading: isTablet(context)
          //     ? null
          //     : BackButton(
          //         color: Colors.white,
          //       ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.person, size: 128),
            Container(
              child: Center(
                child: Card(
                    elevation: 10,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                          "ชื่อ : ${item.data}\nนามสกุล : \nระดับชั้น : \nชื่อเล่น :"),
                    )),
              ),
            ),
            ElevatedButton.icon(
                onPressed: () async {
                  print('Button Clicked.');
                  final result = await Common.hubConnection.invoke(
                      "UpdateEventLogAcknowledgeStatus",
                      args: <Object>[item.id, 3]);
                  print(result);
                  //logger.log(LogLevel.Information, "Result: '$result");
                  Navigator.pop(context, true);
                },
                label: Text(
                  'เสร็จสิ้น',
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.card_travel_outlined, color: Colors.white)),
          ],
        ));
  }
}
