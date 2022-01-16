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
            'images/toaru.jpg',
            width: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  'メーカー：JFJ',
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
                  'ST突入率: 100%',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  '平均連チャン数： 約4.7回',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  'ボーダー： 約17.4回転/1K(等価交換)',
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
