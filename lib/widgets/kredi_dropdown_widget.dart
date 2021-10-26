
import 'package:flutter/material.dart';
import 'package:not_ortalamasi_hesaplama/constans/app_constans.dart';
import 'package:not_ortalamasi_hesaplama/helper/data_helper.dart';

class KrediDropDownWidget extends StatefulWidget {
  final Function onKrediDondur;
  const KrediDropDownWidget({required this.onKrediDondur,  Key? key }) : super(key: key);

  @override
  _KrediDropDownWidgetState createState() => _KrediDropDownWidgetState();
}

class _KrediDropDownWidgetState extends State<KrediDropDownWidget> {
  @override
  double secilenKrediDeger=4;
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
        value: secilenKrediDeger,
        onChanged: (deger) {
          setState(() {
          secilenKrediDeger = deger!;
          widget.onKrediDondur(secilenKrediDeger);
          });
        },
        items: DataHelper.tumDerslerinKredileri(),
        underline: Container(),
      ),
    );
  }
}