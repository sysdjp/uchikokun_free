import 'package:flutter/material.dart';
import 'package:uchikokun_free/gundumuc/edit_screen.dart';
import 'package:uchikokun_free/gundumuc/status_info.dart';
import 'package:uchikokun_free/common/sum_info.dart';

class PageEditDetail extends StatefulWidget {
  const PageEditDetail({Key? key}) : super(key: key);

  @override
  _PageEditDetailState createState() => _PageEditDetailState();
}

class _PageEditDetailState extends State<PageEditDetail> {
  int? _value = 0;

  @override
  Widget build(BuildContext context) {
    if (sumList == null || sumList.isEmpty) {
      return const Card(
        child: Text('データがありません。'),
      );
    }
    //return (Text('テストデータ'));
    return Expanded(
      child: ListView.builder(
        itemCount: sumList.length,
        itemBuilder: (context, index) {
          _value = sumList[index].jyoutai;
          return GestureDetector(
            onTap: () {
              //TODO
              print('GestureDetector tapped $index');
              Navigator.push(
                this.context,
                MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => EditScreen(
                          index: index,
                        )),
              ).then((value) {
                // ここで画面遷移から戻ってきたことを検知できる
                setState(() {});
              });
            },
            child: Card(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(sumList[index].startKaiten),
                      Text(sumList[index].endKaiten),
                      Text(sumList[index].uchikomiTama),
                      Text(sumList[index].mochiTama),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('${sumList[index].kaitenRitu}'),
                      Text('${sumList[index].totalkaitenRitu}'),
                    ],
                  ),
                  Wrap(
                    // _value = sumList[index].jIndex,
                    children: List<Widget>.generate(
                      jyoutai.length,
                      (int index) {
                        return ChoiceChip(
                          label: Text(jyoutai[index].statusmei),
                          selected: _value == index,
                          onSelected: (bool selected) {},
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
