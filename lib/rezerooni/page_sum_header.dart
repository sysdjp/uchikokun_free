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
            'images/rezerooni.jpg',
            width: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  'メーカー：大都技研',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  '製造： 大都技研',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  '大当たり確率： 約1/319.6',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  '大当たり確率： 　⇨約1/99.9',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  'RUSH突入率: 約55%',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  '平均連チャン数： 約3.5回',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  'ボーダー： 約17.6回転/1K(等価交換)',
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
