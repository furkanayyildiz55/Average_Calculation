class Ders{
  final String girilenDersAd;
  final double harfDegeri;
  final double krediDegeri;

  Ders({required this.girilenDersAd , required this.harfDegeri , required this.krediDegeri});

  @override
  String toString() {
    // TODO: implement toString
    return "$girilenDersAd , $harfDegeri , $krediDegeri";
  }
}