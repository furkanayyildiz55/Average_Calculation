import 'package:flutter/material.dart';
import 'package:not_ortalamasi_hesaplama/model/ders.dart';

class DataHelper {

//EKLENEN DERSLERİN LİSTESİ VE EKLEME METHODU
static List<Ders> tumEklenenDersler=[];

static dersEkle(Ders ders){
  tumEklenenDersler.add(ders);
}

//HARF NOTU BÖLÜMÜ
  static List<String> _tumDerslerinHarfleri() {
    return ["AA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 1;
    }
  }


  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _tumDerslerinHarfleri()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _harfiNotaCevir(e),
            ))
        .toList();
  }

///KREDİ BÖLÜMÜ
  static List<int> _tumKrediler() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> tumDerslerinKredileri() {
    return _tumKrediler()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }

//ORTALAMA HESAPLAMA BÖLÜMÜ
static double ortalamaHesapla(){
  double toplamNot=0;
  double toplamKredi=0;

  tumEklenenDersler.forEach((element) {
    toplamNot = toplamNot + (element.krediDegeri * element.harfDegeri);
    toplamKredi = toplamKredi + element.krediDegeri;

  });
  return toplamNot / toplamKredi ;
}

}
