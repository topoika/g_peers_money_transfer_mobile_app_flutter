import 'package:flutter/material.dart';
import 'package:gpeers/base/screens/splash/splash.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GPeers',
      home: SplashScreen(),
    );
  }
}
