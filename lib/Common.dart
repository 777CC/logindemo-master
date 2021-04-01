import 'package:signalr_client/signalr_client.dart';

import 'EventLog.dart';

class Common {
  static String serverUrl = "";
  static HubConnection hubConnection;
  static List<EventLog> waitingList;
}
