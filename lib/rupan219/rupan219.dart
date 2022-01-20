import 'package:flutter/material.dart';
import 'package:uchikokun_free/common/page_sum_title.dart';
import 'package:uchikokun_free/rupan219/page_sum_detail.dart';
import 'package:uchikokun_free/rupan219/page_sum_header.dart';
import 'package:uchikokun_free/rupan219/register_screen.dart';

class rupan219 extends StatefulWidget {
  const rupan219({Key? key}) : super(key: key);

  @override
  _rupan219State createState() => _rupan219State();
}

class _rupan219State extends State<rupan219> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pルパン三世～復活のマモー～ 219ver.'),
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
