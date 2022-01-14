import 'package:flutter/material.dart';
import 'package:uchikokun_free/gundumuc/gumdumuc.dart';
import 'package:uchikokun_free/rezerooni/rezerooni.dart';

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
          Card(
            child: ListTile(
              leading: Image.asset('images/rezerooni.jpg'),
              title: const Text('P Re:ゼロから始める異世界生活 鬼がかりver.'),
              subtitle: Text('大都'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => Rezerooni()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
