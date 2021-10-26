import 'package:flutter/material.dart';
import 'package:not_ortalamasi_hesaplama/constans/app_constans.dart';
import 'package:not_ortalamasi_hesaplama/helper/data_helper.dart';

class HardDropDownWidget extends StatefulWidget {
  final Function onHarfDondur;
  
  const HardDropDownWidget({required this.onHarfDondur, Key? key}) : super(key: key);

  @override
  _HardDropDownWidgetState createState() => _HardDropDownWidgetState();
}

class _HardDropDownWidgetState extends State<HardDropDownWidget> {
  @override
  double secilenHarfDeger = 0;
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
        value: secilenHarfDeger,
        onChanged: (deger) {
          setState(() {
          secilenHarfDeger = deger!;
          print("$deger");
          widget.onHarfDondur(secilenHarfDeger); //CALLBACK
          });
        },
        items: DataHelper.tumDerslerinHarfleri(),
        underline: Container(),
      ),
    );
  }
}
