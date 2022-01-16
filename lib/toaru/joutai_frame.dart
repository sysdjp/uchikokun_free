import 'package:flutter/material.dart';
import 'package:uchikokun_free/toaru/register_screen.dart';
import 'package:uchikokun_free/toaru/status_info.dart';

class JyotaiFrame extends StatefulWidget {
  final int length;
  const JyotaiFrame({Key? key, required this.length}) : super(key: key);

  @override
  _JyotaiFrameState createState() => _JyotaiFrameState();
}

class _JyotaiFrameState extends State<JyotaiFrame> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List<Widget>.generate(
        jyoutai.length,
        (int index) {
          return ChoiceChip(
            label: Text(jyoutai[index].statusmei),
            selected: _value == index,
            onSelected: (bool selected) {
              setState(() {
                _value = selected ? index : 0;
                RegisterScreen.hozon = _value;
              });
            },
          );
        },
      ).toList(),
    );
  }
}
