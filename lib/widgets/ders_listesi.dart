import 'package:flutter/material.dart';
import 'package:not_ortalamasi_hesaplama/constans/app_constans.dart';
import 'package:not_ortalamasi_hesaplama/helper/data_helper.dart';
import 'package:not_ortalamasi_hesaplama/model/ders.dart';
import 'package:not_ortalamasi_hesaplama/widgets/ortalama_goster.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikarildi;
  const DersListesi({required this.onElemanCikarildi ,Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler =DataHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a){
                  onElemanCikarildi(index);  //CALLBACK //Bu method on dissmis çağrıldığında clasın üretildiği sınıfa index bilgisini gönderir
                },
                child: Card(
                  child: ListTile(
                    title: Text(tumDersler[index].girilenDersAd),
                    leading: CircleAvatar(
                      backgroundColor: Sabitler.anaRenk,
                      child: Text(
                        (tumDersler[index].harfDegeri *
                                tumDersler[index].krediDegeri)
                            .toStringAsFixed(0),
                      ),
                    ),
                    subtitle: Text(
                        '${tumDersler[index].krediDegeri} Kredi , ${tumDersler[index].harfDegeri} Not'),
                  ),
                ),
              );
            })
        : Container(
            child: Text(
              "Lütfen Ders Ekleyin..",
              style: Sabitler.BaslikStyle,
            ),
            alignment: Alignment.center,
          );
  }
}

