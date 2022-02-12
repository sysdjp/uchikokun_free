import 'package:flutter/material.dart';
import 'package:uchikokun_free/common/page_sum_title.dart';
import 'package:uchikokun_free/rupan2000/page_sum_detail.dart';
import 'package:uchikokun_free/rupan2000/page_sum_header.dart';
import 'package:uchikokun_free/rupan2000/register_screen.dart';

class rupan2000 extends StatefulWidget {
  const rupan2000({Key? key}) : super(key: key);

  @override
  _rupan2000State createState() => _rupan2000State();
}

class _rupan2000State extends State<rupan2000> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pルパン三世 2000カラットの涙'),
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
