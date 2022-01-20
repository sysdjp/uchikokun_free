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
            'images/keiji3.jpg',
            width: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  'メーカー：ニューギン',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  '大当たり確率： 約1/1/319.68',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  '大当たり確率： 　⇨約1/76.56',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  '確変突入率: 55%',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  'ST回転数: 大当り後135回',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  '平均連チャン数： 約4.4回',
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
