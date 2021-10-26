import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:not_ortalamasi_hesaplama/constans/app_constans.dart';
import 'package:not_ortalamasi_hesaplama/helper/data_helper.dart';
import 'package:not_ortalamasi_hesaplama/model/ders.dart';
import 'package:not_ortalamasi_hesaplama/widgets/ders_listesi.dart';
import 'package:not_ortalamasi_hesaplama/widgets/harf_dropdown_widget.dart';
import 'package:not_ortalamasi_hesaplama/widgets/kredi_dropdown_widget.dart';
import 'package:not_ortalamasi_hesaplama/widgets/ortalama_goster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplaPageState createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  double secilenHarfDeger = 0;
  double secilenKrediDeger = 1;

  String girilenDersAdi = ' ';

  Widget build(BuildContext context) {
    print("scscscscc");
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Center(
            child: Text(
              Sabitler.BaslikText,
              style: Sabitler.BaslikStyle,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            ///FORM
            Row(
              children: [
                //form kısmı
                Expanded(
                  flex: 2,
                  child: Container(
                    child: _buildForm(),
                  ),
                ),
                //ortalama kısmı
                Expanded(
                  flex: 1,
                  child: Container(
                    child: OrtalamaGoster(
                      dersSayisi: DataHelper.tumEklenenDersler.length,
                      ortalama: DataHelper.ortalamaHesapla(),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 9),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Divider(
                  color: Sabitler.anaRenk,
                  height: 15,
                )),
                Text(
                  "Dersi silmek için sağa kaydırın",
                  style: Sabitler.BilgiStyle,
                ),
                Expanded(
                    child: Divider(
                  color: Sabitler.anaRenk,
                  height: 15,
                )),
              ],
            )),
            SizedBox(height: 9),

            ///ELEMANLAR
            Expanded(child: DersListesi(
              onElemanCikarildi: (index) {
                DataHelper.tumEklenenDersler.removeAt(index);
                setState(() {});
              },
            ))
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.YatayPadding,
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, //
              children: [
                Expanded(
                  child: Padding(
                    padding: Sabitler.YatayPadding,
                    //HARF DROPDOWN--
                    child: HardDropDownWidget(
                      onHarfDondur: (index) {
                        secilenHarfDeger = index;
                        print("$index");
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: Sabitler.YatayPadding,
                    //KREDİ DROPDOWN--
                    child: KrediDropDownWidget(
                      onKrediDondur: (index) {
                        secilenKrediDeger = index;
                      },
                    ),
                  ),
                ),
                IconButton(
                    onPressed: _dersEkleVeOrtHesapla,
                    icon: Icon(Icons.arrow_forward_ios_sharp)),
              ])
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return "Ders Adını Giriniz";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: "Ders Adı",
          border: OutlineInputBorder(
              borderSide: BorderSide.none, borderRadius: Sabitler.borderRadius),
          filled: true, //İçini renkle doldurur
          fillColor: Sabitler.anaRenk.shade200.withOpacity(0.3)),
    );
  }

  void _dersEkleVeOrtHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!
          .save(); //Forum içindeki elemanların on save methodunu çalıştırır...
      var eklenecekDers = Ders(
          harfDegeri: secilenHarfDeger,
          krediDegeri: secilenKrediDeger,
          girilenDersAd: girilenDersAdi);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    } else {}
  }
}
