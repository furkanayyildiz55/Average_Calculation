import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const anaRenk = Colors.indigo;
  static const String BaslikText = "Ortalama Hesapla";

  static final TextStyle BaslikStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: anaRenk);

  static final TextStyle BilgiStyle = GoogleFonts.quicksand(
      fontSize: 12, fontWeight: FontWeight.w500, color: anaRenk);

  static BorderRadius borderRadius = BorderRadius.circular(24);

    static final TextStyle DersSayisiStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: anaRenk);

    static final TextStyle OrtalamaStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: anaRenk);

   static EdgeInsetsGeometry YatayPadding =EdgeInsets.symmetric(horizontal: 8);
}


