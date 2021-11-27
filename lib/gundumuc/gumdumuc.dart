import 'package:flutter/material.dart';
import 'package:uchikokun_free/gundumuc/page_sum_detail.dart';
import 'package:uchikokun_free/gundumuc/page_sum_header.dart';
import 'package:uchikokun_free/gundumuc/page_sum_title.dart';
import 'package:uchikokun_free/gundumuc/register_screen.dart';

class GumdumUC extends StatefulWidget {
  const GumdumUC({Key? key}) : super(key: key);

  @override
  _GumdumUCState createState() => _GumdumUCState();
}

class _GumdumUCState extends State<GumdumUC> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PF 機動戦士ガンダムユニコーン'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          //TODO FloatingActionButton.onPressed
          onPressed: () => Navigator.push(
            this.context,
            MaterialPageRoute(
                fullscreenDialog: true, builder: (context) => RegisterScreen()),
          ).then((value) {
            // ここで画面遷移から戻ってきたことを検知できる
            setState(() {});
          }),
          tooltip: 'データ追加',
        ),
        body: Column(children: [
          PageSumHeader(),
          //TODO サマリーデータ
          PageSumTitle(),
          PageSumDetail(),
        ]),
      ),
    );
  }
}
