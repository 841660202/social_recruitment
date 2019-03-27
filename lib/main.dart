import 'package:flutter/material.dart';
import 'package:social_recruitment/page/tab-nav.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
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
      home: TabNav(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




// 2




// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//           actions: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.settings),
//               onPressed: () {
//                 PermissionHandler().openAppSettings().then((bool hasOpened) =>
//                     debugPrint('App Settings opened: ' + hasOpened.toString()));
//               },
//             )
//           ],
//         ),
//         body: Center(
//           child: ListView(
//               children: PermissionGroup.values
//                   .where((PermissionGroup permission) {
//                     if (Platform.isIOS) {
//                       return permission != PermissionGroup.unknown &&
//                           permission != PermissionGroup.phone &&
//                           permission != PermissionGroup.sms &&
//                           permission != PermissionGroup.storage;
//                     } else {
//                       return permission != PermissionGroup.unknown &&
//                           permission != PermissionGroup.mediaLibrary &&
//                           permission != PermissionGroup.photos &&
//                           permission != PermissionGroup.reminders;
//                     }
//                   })
//                   .map((PermissionGroup permission) =>
//                       PermissionWidget(permission))
//                   .toList()),
//         ),
//       ),
//     );
//   }
// }

// class PermissionWidget extends StatefulWidget {
//   const PermissionWidget(this._permissionGroup);

//   final PermissionGroup _permissionGroup;

//   @override
//   _PermissionState createState() => _PermissionState(_permissionGroup);
// }

// class _PermissionState extends State<PermissionWidget> {
//   _PermissionState(this._permissionGroup);

//   final PermissionGroup _permissionGroup;
//   PermissionStatus _permissionStatus = PermissionStatus.unknown;

//   @override
//   void initState() {
//     super.initState();
//     print('权限');
//     print(_permissionGroup);
//     _listenForPermissionStatus();
//   }

//   void _listenForPermissionStatus() {
//     final Future<PermissionStatus> statusFuture =
//         PermissionHandler().checkPermissionStatus(_permissionGroup);
//     print('_listenForPermissionStatus');
//     statusFuture.then((PermissionStatus status) {
//       setState(() {
//         _permissionStatus = status;
//       });
//     });
//   }

//   Color getPermissionColor() {
//     switch (_permissionStatus) {
//       case PermissionStatus.denied:
//         return Colors.red;
//       case PermissionStatus.granted:
//         return Colors.green;
//       default:
//         return Colors.grey;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(_permissionGroup.toString()),
//       subtitle: Text(
//         _permissionStatus.toString(),
//         style: TextStyle(color: getPermissionColor()),
//       ),
//       trailing: IconButton(
//           icon: const Icon(Icons.info),
//           onPressed: () {
//             checkServiceStatus(context, _permissionGroup);
//           }),
//       onTap: () {
//         requestPermission(_permissionGroup);
//       },
//     );
//   }

//   void checkServiceStatus(BuildContext context, PermissionGroup permission) {
//     PermissionHandler()
//         .checkServiceStatus(permission)
//         .then((ServiceStatus serviceStatus) {
//       final SnackBar snackBar =
//           SnackBar(content: Text(serviceStatus.toString()));

//       Scaffold.of(context).showSnackBar(snackBar);
//     });
//   }

//   Future<void> requestPermission(PermissionGroup permission) async {
//     final List<PermissionGroup> permissions = <PermissionGroup>[permission];
//     final Map<PermissionGroup, PermissionStatus> permissionRequestResult =
//         await PermissionHandler().requestPermissions(permissions);

//     setState(() {
//       print(permissionRequestResult);
//       _permissionStatus = permissionRequestResult[permission];
//       print(_permissionStatus);
//     });
//   }
// }



