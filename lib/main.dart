import 'package:flutter/material.dart';

import 'package:app_disenos/src/pages/pinterest_page.dart';
// import 'package:app_disenos/src/pages/slideshow_page.dart';
// import 'package:app_disenos/src/pages/grafica_circular_page.dart';
//import 'package:app_disenos/src/pages/animaciones_page.dart';
//import 'package:app_disenos/src/labs/circular_progress_page.dart';
//import 'package:app_disenos/src/pages/header_page.dart';
//import 'package:app_disenos/src/retos/cuadrado_animado_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños Page',
      home: PinterestPage()
    );
  }
}