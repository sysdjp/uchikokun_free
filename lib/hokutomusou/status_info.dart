class Jyoutai {
  final int joutaiId;
  final String statusmei;

  Jyoutai({required this.joutaiId, required this.statusmei});
}

final List<Jyoutai> jyoutai = [
  Jyoutai(joutaiId: 0, statusmei: "投資中"),
  Jyoutai(joutaiId: 1, statusmei: "6R通常"),
  Jyoutai(joutaiId: 2, statusmei: "6R確変"),
  Jyoutai(joutaiId: 3, statusmei: "16R確変"),
  Jyoutai(joutaiId: 4, statusmei: "8R確変"),
  Jyoutai(joutaiId: 5, statusmei: "4R確変"),
  Jyoutai(joutaiId: 6, statusmei: "ST抜け"),
  Jyoutai(joutaiId: 7, statusmei: "時短抜け"),
];
