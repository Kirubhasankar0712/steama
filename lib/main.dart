import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:steama/matchScreen.dart';
import 'package:steama/profileScreen.dart';

import 'matchListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Steam a'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<NotificationModel> notificationModel = [];
  List<NotificationModel> notificationListModel = [];
  FlutterLocalNotificationsPlugin? flutterNotificationPlugin;
  var androidPlatformChannelSpecifics =
  AndroidNotificationDetails(
    'Notification Channel ID',
    'Channel Name',
    channelDescription: 'Description',
    // sound: 'slow_spring_board',
    importance: Importance.max,
    priority: Priority.high,
  );

  Future<void> _showNotification() async {
    int index = _counter ;
    // if(index=notificationModel.length){
      const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails('steama', 'footballchannel',
          channelDescription: 'steam a football channel',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker');
      const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
      await flutterNotificationPlugin!.show(
          index, notificationModel[index].title, notificationModel[index].description, notificationDetails,
          payload: notificationModel[index].clickAction.toString());
      _counter = _counter +1;
      setState(() {
        notificationListModel.add(notificationModel[index]);
      });

    // }
  }

  @override
  void initState() {
    var initializationSettingsAndroid = new AndroidInitializationSettings('notification');



    var initializationSettings = new InitializationSettings(android: initializationSettingsAndroid);

    flutterNotificationPlugin = FlutterLocalNotificationsPlugin();

    flutterNotificationPlugin!.initialize(initializationSettings);

    notificationModel.add(NotificationModel(
        "app_icon",
        "Tesla Cars",
        "Tesla is accelerating the world's transition to sustainable energy with electriccars.",
        1,
        false));
    notificationModel.add(NotificationModel(
        "app_icon",
        "Match Started",
        "Match between HOME vs AWAY has `(started/ a break / finished).",
        2,
        false));
    notificationModel.add(NotificationModel("app_icon", "Match goals",
        "PLAYER has scored for HOME team against AWAY", 3, false));
    notificationModel.add(NotificationModel("app_icon", "Match foul",
        "PLAYER has received 'Yellow' card", 4, false));
    notificationModel.add(NotificationModel("app_icon", "PL Table update",
        "HOME team has moved to 3rd place from 6th", 5, false));
  }
  Future onSelectNotification(String payload) async{
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
              "Hello Everyone"
          ),
          content: Text(
              "$payload"
          ),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.builder(
          itemCount: notificationListModel.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(2),
              child: InkWell(
                onTap: (){
                  setState(() {
                    notificationListModel[index].read =true;
                  });
                  switch(index){
                    case 0:
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(20.0)), //this right here
                              child: Container(
                                height: 300,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Container(
                                         height: 155,
                                           child: Image.network('https://electrek.co/wp-content/uploads/sites/3/2022/01/Tesla-hero-Model-3-Y-S.jpg?quality=82&strip=all&w=1600')),
                                      Text(notificationListModel[index].title,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                      Text(notificationListModel[index].description,style: TextStyle(color: Colors.black,fontSize: 16),),
                                      SizedBox(
                                        width: 320.0,
                                        child: RaisedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "OK",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          color: const Color(0xFF1BC0C5),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                      break;
                    case 1:
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder:
                                  (BuildContext context) =>
                               MatchScreen(1)));
                      break;
                    case 2:
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder:
                                  (BuildContext context) =>
                               MatchScreen(2)));
                      break;
                    case 3:
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder:
                                  (BuildContext context) =>
                              const ProfileScreen()));
                      break;
                    case 4:
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder:
                                  (BuildContext context) =>
                               MatchListScreen()));
                      break;
                  }

                },
                child: Card(
                  color: notificationListModel[index].read
                      ? Colors.white
                      : Color(0xffc1f6f7),
                  child: Container(
                    padding: EdgeInsets.all(2),
                    child: Row(
                      children: [
                        Expanded(
                          child: Icon(Icons.notifications),
                          flex: 1,
                        ),Expanded(
                          child: Column(
                            children: [
                              Text(notificationListModel[index].title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                              Text(notificationListModel[index].description,style: TextStyle(fontSize: 16,color: Colors.grey),)
                            ],
                          ),
                          flex: 9,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showNotification,
        tooltip: 'Notification',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NotificationModel {
  String icon, title, description;
  int clickAction;
  bool read;

  NotificationModel(
      this.icon, this.title, this.description, this.clickAction, this.read);
}
