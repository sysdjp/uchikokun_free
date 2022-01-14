import 'package:flutter/material.dart';

class PageSumTitle extends StatelessWidget {
  const PageSumTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text('開始回転'),
              Text('終了回転数'),
              Text('今回回転数'),
              Text('累計通常回転数'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text('打込玉数'),
              Text('持ち玉　'),
              Text('今回回転率'),
              Text('TOTAL回転率'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [Text('投資中/当たり/転落')],
          ),
        ],
      ),
    );
  }
}
