import 'package:flutter/material.dart';
import 'package:not_ortalamasi_hesaplama/constans/app_constans.dart';

class OrtalamaGoster extends StatefulWidget {
  final int dersSayisi;
  final double ortalama;

  const OrtalamaGoster(
      {required this.dersSayisi, required this.ortalama, Key? key})
      : super(key: key);

  @override
  _OrtalamaGosterState createState() => _OrtalamaGosterState();
}

class _OrtalamaGosterState extends State<OrtalamaGoster> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.dersSayisi > 0
              ? '${widget.dersSayisi} ders eklendi '
              : 'Ders Ekleyin',
          style: Sabitler.DersSayisiStyle,
        ),
        Text(
          widget.ortalama >= 0 ? '${widget.ortalama.toStringAsFixed(2)}' : '0.00',
          style: Sabitler.OrtalamaStyle,
        ),
        Text(
          "Ortalama",
          style: Sabitler.DersSayisiStyle,
        ),
      ],
    );
  }
}
