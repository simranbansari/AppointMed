import 'package:flutter/material.dart';
import 'navigation.dart';
import 'screens/loginpage.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'BookTrades',
        initialRoute: '/',
        routes: {
          '/': (context) => loginpage(),
        },
        theme: ThemeData(accentColor: Color.fromRGBO(61, 191, 165, 100)));
  }
}
