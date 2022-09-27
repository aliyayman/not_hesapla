import 'package:flutter/material.dart';
import 'package:not_hesapla/constants/app_constants.dart';
import 'package:not_hesapla/views/anasayfaPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ortalama Hesapla',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Constants.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: Anasayfa()
    );
  }
}