List<SumDetail> sumList = [];

class SumDetail {
  late String startKaiten;
  late String endKaiten;
  late String kaitensu;
  late String totalkaitensu;
  late String uchikomiTama;
  late String mochiTama;
  late String kaitenRitu;
  late String totalkaitenRitu;
  late int jyoutai;

  SumDetail(
      {required this.startKaiten,
      required this.endKaiten,
      required this.kaitensu,
      required this.totalkaitensu,
      required this.uchikomiTama,
      required this.mochiTama,
      required this.kaitenRitu,
      required this.totalkaitenRitu,
      required this.jyoutai});
}
