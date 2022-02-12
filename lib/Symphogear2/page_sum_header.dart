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
            'images/Symphogear2.jpg',
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
                  '大当たり確率： 1/230',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  '大当たり確率： 　⇨約1/7.7',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  'シンフォギアチャンスGX突入率: 約51%',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  '平均連チャン数： 約3.7回回',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  'ボーダー： 約19.0回転/1K(等価交換)',
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
