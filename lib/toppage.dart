import 'package:flutter/material.dart';
import 'package:uchikokun_free/gundumuc/gumdumuc.dart';
import 'package:uchikokun_free/hokutomusou/hokutomusou.dart';
import 'package:uchikokun_free/rezerooni/rezerooni.dart';
import 'package:uchikokun_free/toaru/toaru.dart';

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
              subtitle: Text('大都技研'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => Rezerooni()));
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('images/hokutomusou.jpg'),
              title: const Text('ぱちんこCR真・北斗無双'),
              subtitle: Text('Sammy'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => Hokutomusou()));
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('images/toaru.jpg'),
              title: const Text('Pとある魔術の禁書目録'),
              subtitle: Text('JFJ'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        fullscreenDialog: true, builder: (context) => Toaru()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
