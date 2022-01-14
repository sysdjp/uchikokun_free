import 'package:flutter/material.dart';
import 'package:uchikokun_free/common/page_sum_title.dart';
import 'package:uchikokun_free/hokutomusou/page_sum_detail.dart';
import 'package:uchikokun_free/hokutomusou/page_sum_header.dart';
import 'package:uchikokun_free/hokutomusou/register_screen.dart';

class hokutomusou extends StatefulWidget {
  const hokutomusou({Key? key}) : super(key: key);

  @override
  _hokutomusouState createState() => _hokutomusouState();
}

class _hokutomusouState extends State<hokutomusou> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ぱちんこCR真・北斗無双'),
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
