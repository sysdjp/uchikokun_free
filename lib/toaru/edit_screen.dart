import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uchikokun_free/common/sum_info.dart';
import 'package:uchikokun_free/toaru/joutai_frame.dart';

class EditScreen extends StatefulWidget {
  final int index;
  EditScreen({Key? key, required this.index}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _formKey = GlobalKey<FormState>();
  late int index;
  final startKaitenTextEditing = TextEditingController();
  final endKaitenTextEditing = TextEditingController();
  final uchikomiTamaTextEditing = TextEditingController();
  final mochiTamaTextEditing = TextEditingController();
  String startKaiten = "";
  String endKaiten = "";
  String konkaikaitensu = "";
  String soKaitensu = "";
  String uchikomiTama = "";
  String mochiTama = "";

  @override
  void initState() {
    index = widget.index;
    startKaitenTextEditing.text = sumList[index].startKaiten;
    endKaitenTextEditing.text = sumList[index].endKaiten;
    uchikomiTamaTextEditing.text = sumList[index].uchikomiTama;
    mochiTamaTextEditing.text = sumList[index].mochiTama;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('編集画面'),
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
                int _startkaiten = 0;
                int _endkaiten = 0;
                int _konkaikaitensu = 0;
                int _totalkaitensu = 0;
                int _uchikomitama = 0;
                int _souchikomitama = 0;
                double _konkaikaitenritu = 0.0;
                double _totalKaitenritu = 0.0;
                int _mochitama = 0;

                sumList[index].startKaiten = startKaitenTextEditing.text;
                sumList[index].endKaiten = endKaitenTextEditing.text;
                sumList[index].uchikomiTama = uchikomiTamaTextEditing.text;
                sumList[index].mochiTama = mochiTamaTextEditing.text;
                for (var i = 0; i < sumList.length; i++) {
                  // 開始・終了回転数
                  _startkaiten = int.parse(sumList[i].startKaiten);
                  _endkaiten = int.parse(sumList[i].endKaiten);
                  //今回回転数
                  _konkaikaitensu = _endkaiten - _startkaiten;
                  sumList[i].kaitensu = _konkaikaitensu.toString();
                  //累計通常回転数
                  _totalkaitensu = _totalkaitensu + _konkaikaitensu;
                  sumList[i].totalkaitensu = (_totalkaitensu).toString();
                  //打込み玉
                  _uchikomitama = int.parse(sumList[i].uchikomiTama);
                  sumList[i].uchikomiTama = _uchikomitama.toString();
                  //今回回転率
                  _konkaikaitenritu =
                      _konkaikaitensu / (_uchikomitama / 250).toDouble();
                  sumList[i].kaitenRitu = _konkaikaitenritu.toStringAsFixed(2);
                  //総打込み玉
                  _souchikomitama =
                      _souchikomitama + int.parse(sumList[i].uchikomiTama);
                  //総回転率
                  _totalKaitenritu =
                      _totalkaitensu / (_souchikomitama / 250).toDouble();
                  sumList[i].totalkaitenRitu =
                      _totalKaitenritu.toStringAsFixed(2);
                }
                Navigator.pop(context);
              },
              child: Text('更新'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: const Text('削除確認'),
                          content: const Text('削除してよろしいですか？'),
                          actions: [
                            TextButton(
                              child: const Text('はい'),
                              onPressed: () {
                                print('index: $index');
                                sumList.removeAt(index);
                                Fluttertoast.showToast(msg: '削除しました。');
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: const Text('いいえ'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ));
              },
              child: Text('削除'),
            ),
          ],
        ),
      ),
    );
  }
}
