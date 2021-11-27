import 'package:flutter/material.dart';
import 'package:uchikokun_free/gundumuc/gumdumuc.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('機種一覧'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Image.asset('images/gundumuc.jpg'),
              title: const Text('PF 機動戦士ガンダムユニコーン'),
              subtitle: Text('SANKYO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => GumdumUC()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
