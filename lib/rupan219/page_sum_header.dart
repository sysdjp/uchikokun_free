import 'package:flutter/material.dart';

class PageSumHeader extends StatelessWidget {
  const PageSumHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'images/rupan219.jpg',
            width: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  'メーカー：平和',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  '大当たり確率： 約1/219.9',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  '大当たり確率： 　⇨約1/53.1',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  'ST突入率: 51%',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  'ST回転数: 大当り後88回',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  '平均連チャン数： 約3.9回',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  'ボーダー： 約18.5回転/1K(等価交換)',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
