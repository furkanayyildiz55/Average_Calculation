import 'package:flutter/material.dart';
import 'package:not_ortalamasi_hesaplama/constans/app_constans.dart';
import 'package:not_ortalamasi_hesaplama/widgets/ortalama_hesapla_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Not Ortalama",
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primarySwatch: Sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: OrtalamaHesaplaPage(),
    );
  }
}