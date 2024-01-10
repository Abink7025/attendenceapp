import 'package:attendenceapp/firebase_options.dart';
import 'package:attendenceapp/screens/new.dart';
import 'package:attendenceapp/screens/splash_screen.dart';
import 'package:attendenceapp/widgets/batch_widget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ConnectivityResult? connectivityResult;
  Connectivity connectivity = Connectivity();

  @override
  void initState() {
    connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        connectivityResult = result;
        connectivityCheck(connectivityResult!);
      });
    });
    // TODO: implement initState
    super.initState();
  }

  String connectivityCheck(ConnectivityResult result) {
    if (result == ConnectivityResult.wifi) {
      return "You are now connected to wifi";
    } else if (result == ConnectivityResult.mobile) {
      print('mobile data');
      return "You are now connected to mobile data";
    } else if (result == ConnectivityResult.ethernet) {
      return "You are now connected to ethernet";
    } else if (result == ConnectivityResult.bluetooth) {
      return "You are now connected to bluetooth";
    } else if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(),
          ));
      return "No connection available";
    } else {
      return "No Connection!!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: connectivityResult == null ||
                connectivityResult == ConnectivityResult.none
            ? Scaffold(
                body: Center(
                  child: Text('no internet'),
                ),
              )
            : SplashScreen(),
            // : NewScreen(),
            );
  }
}
