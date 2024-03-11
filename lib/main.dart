// ignore_for_file: constant_identifier_names, use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:estacionamento/app/views/home_page.dart';
import 'package:flutter/material.dart';

import 'app/controllers/controller.dart';
import 'app/repository/repository.dart';
import 'shared/data/data.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Dio dio = Dio();
    final Repository repository = Repository(dio, Data.instance);
    final Controller controller = Controller(repository);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blueGrey,
      ),
      title: 'App Estacionamento',
      home: HomePage(controller: controller),
    );
  }
}
