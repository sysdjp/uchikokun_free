import 'package:flutter/material.dart';
import 'package:uchikokun_free/common/page_sum_title.dart';
import 'package:uchikokun_free/rezerooni/page_sum_detail.dart';
import 'package:uchikokun_free/rezerooni/page_sum_header.dart';
import 'package:uchikokun_free/rezerooni/register_screen.dart';

class Rezerooni extends StatefulWidget {
  const Rezerooni({Key? key}) : super(key: key);

  @override
  _RezerooniState createState() => _RezerooniState();
}

class _RezerooniState extends State<Rezerooni> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('P Re:ゼロから始める異世界生活 鬼がかりver.'),
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
          PageSumTitle(),
          PageSumDetail(),
        ]),
      ),
    );
  }
}
