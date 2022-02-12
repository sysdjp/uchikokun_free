class Jyoutai {
  final int joutaiId;
  final String statusmei;

  Jyoutai({required this.joutaiId, required this.statusmei});
}

final List<Jyoutai> jyoutai = [
  Jyoutai(joutaiId: 0, statusmei: "投資中"),
  Jyoutai(joutaiId: 1, statusmei: "3R通常"),
  Jyoutai(joutaiId: 2, statusmei: "3R右打ち"),
  Jyoutai(joutaiId: 3, statusmei: "6R右打ち"),
  Jyoutai(joutaiId: 4, statusmei: "7R右打ち"),
  Jyoutai(joutaiId: 5, statusmei: "10R右打ち"),
  Jyoutai(joutaiId: 6, statusmei: "時短抜け"),
];
