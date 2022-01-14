import 'package:flutter/material.dart';
import 'package:uchikokun_free/gundumuc/joutai_frame.dart';
import 'package:uchikokun_free/common/sum_info.dart';

class RegisterScreen extends StatefulWidget {
  static int hozon = 0;
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  final _formKey = GlobalKey<FormState>();
  final startKaitenTextEditing = TextEditingController();
  final endKaitenTextEditing = TextEditingController();
  final konkaikaitensuTextEditing = TextEditingController();
  final soKaitensuTextEditing = TextEditingController();
  final uchikomiTamaTextEditing = TextEditingController();
  final mochiTamaTextEditing = TextEditingController();
  String startKaiten = "";
  String endKaiten = "";
  String konkaikaitensu = "";
  String soKaitensu = "";
  String uchikomiTama = "";
  String mochiTama = "";

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('登録画面'),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text(
                        '開始回転数',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: startKaitenTextEditing,
                        autovalidateMode: AutovalidateMode.disabled,
                        autofocus: true,
                        textAlign: TextAlign.center,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '未入力';
                          }
                          if (int.tryParse(value) == null) {
                            return '数字以外不可';
                          }
                          startKaiten = value;
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      flex: 1,
                      child: Text(
                        '終了回転数',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: endKaitenTextEditing,
                        textAlign: TextAlign.center,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '未入力';
                          }
                          if (int.tryParse(value) == null) {
                            return '数字以外不可';
                          }
                          endKaiten = value;
                          return null;
                        },
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text('打込み玉数',
                            style: TextStyle(
                              fontSize: 16,
                            ))),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: uchikomiTamaTextEditing,
                        textAlign: TextAlign.center,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '未入力';
                          }
                          if (int.tryParse(value) == null) {
                            return '数字以外不可';
                          }
                          uchikomiTama = value;
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text('持ち玉',
                          style: TextStyle(
                            fontSize: 16,
                          )),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: mochiTamaTextEditing,
                        textAlign: TextAlign.center,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '未入力';
                          }
                          if (int.tryParse(value) == null) {
                            return '数字以外不可';
                          }
                          mochiTama = value;
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              JyotaiFrame(length: sumList.length),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    int _startkaiten = 0;
                    int _endkaiten = 0;
                    int _konkaikaitensu = 0;
                    int _totalkaitensu = 0;
                    int _uchikomitama = 0;
                    int _souchikomitama = 0;
                    double _konkaikaitenritu = 0.0;
                    double _totalKaitenritu = 0.0;
                    int _uchikomiTama = 0;
                    int _mochitama = 0;

                    if (sumList.isEmpty) {
                      _startkaiten = int.parse(startKaitenTextEditing.text);
                      _endkaiten = int.parse(endKaitenTextEditing.text);
                      _konkaikaitensu = _endkaiten - _startkaiten;
                      _totalkaitensu = _konkaikaitensu;
                      _uchikomiTama = _uchikomiTama +
                          int.parse(uchikomiTamaTextEditing.text);
                      _souchikomitama = _uchikomiTama;
                      _konkaikaitenritu =
                          (_konkaikaitensu / (_uchikomiTama / 250)).toDouble();
                      _totalKaitenritu = _konkaikaitenritu;
                    } else {
                      // 過去の情報の再計算
                      for (var i = 0; i < sumList.length; i++) {
                        // 開始・終了回転数
                        _startkaiten = int.parse(sumList[i].startKaiten);
                        _endkaiten = int.parse(sumList[i].endKaiten);
                        if (sumList[i].jyoutai < 4) {
                          //今回回転数
                          _konkaikaitensu = (_endkaiten - _startkaiten);
                          //累計通常回転数
                          _totalkaitensu = _totalkaitensu + _konkaikaitensu;
                          //打込み玉
                          _uchikomitama = int.parse(sumList[i].uchikomiTama);
                          //総打込み玉
                          _souchikomitama = _souchikomitama +
                              int.parse(sumList[i].uchikomiTama);
                        } else {
                          _konkaikaitensu = 0;
                          _totalkaitensu = _totalkaitensu + _konkaikaitensu;
                          _uchikomitama = 0;
                        }
                      }

                      if (RegisterScreen.hozon < 4) {
                        //今回回転数
                        _konkaikaitensu = int.parse(endKaitenTextEditing.text) -
                            int.parse(startKaitenTextEditing.text);
                        //今回打込み玉
                        _uchikomiTama = int.parse(uchikomiTamaTextEditing.text);
                        //今回回転率
                        _konkaikaitenritu =
                            _konkaikaitensu / (_uchikomiTama / 250);
                        //総回転数
                        _totalkaitensu = _totalkaitensu +
                            int.parse(endKaitenTextEditing.text) -
                            int.parse(startKaitenTextEditing.text);
                        //総打込み玉
                        _souchikomitama = _souchikomitama +
                            int.parse(uchikomiTamaTextEditing.text);
                        //今回回転率
                        _konkaikaitenritu =
                            (_konkaikaitensu / (_uchikomiTama / 250))
                                .toDouble();
                        //累計回転率
                        _totalKaitenritu =
                            (_totalkaitensu / (_souchikomitama / 250))
                                .toDouble();
                      } else {
                        _konkaikaitensu = 0;
                        _konkaikaitenritu = 0;
                        _totalKaitenritu = 0;
                        _totalkaitensu = 0;
                        _uchikomiTama = 0;
                      }
                    }

                    // 今回の情報の登録
                    sumList.add(SumDetail(
                      startKaiten: startKaiten,
                      endKaiten: endKaiten,
                      kaitensu: _konkaikaitensu.toString(),
                      totalkaitensu: _totalkaitensu.toString(),
                      kaitenRitu: _konkaikaitenritu.toStringAsFixed(2),
                      totalkaitenRitu: _totalKaitenritu.toStringAsFixed(2),
                      uchikomiTama: _uchikomiTama.toString(),
                      mochiTama: mochiTama,
                      jyoutai: RegisterScreen.hozon,
                    ));
                    RegisterScreen.hozon = 0;
                    Navigator.pop(context);
                  }
                  ;
                },
                child: const Text('保存'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
