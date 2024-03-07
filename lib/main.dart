// ignore_for_file: constant_identifier_names, use_build_context_synchronously

import 'package:estacionamento/home.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blueGrey,
      ),

      title: 'SAGA Android',
      home: const HomePage(),

//      initialRoute: '/login_page',
//      onUnknownRoute: (RouteSettings setting) {
//        return MaterialPageRoute(builder: (context) => Container());
//      },
//      routes: {
//        '/login_page': (context) => LoginPage(title: 'SAGA Flutter'),
//        '/voice_page': (context) => VoicePage(title: 'Apanha'),
//      },
    );
  }
}
