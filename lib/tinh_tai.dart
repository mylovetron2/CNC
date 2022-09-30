import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TinhTai extends StatefulWidget {
  const TinhTai({Key? key}) : super(key: key);

  @override
  State<TinhTai> createState() => _TinhTaiState();
}

class _TinhTaiState extends State<TinhTai> {
  TextEditingController dosau = TextEditingController()..text = '3000';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TÍNH TẢI")),
      body: ListView(
          //cursorColor: Theme.of(context).cursorColor,
          ///padding: EdgeInsets.symmetric(horizontal: 10.0),
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  //cursorColor: Theme.of(context).cursorColor,
                  //initialValue: 'Input text',
                  controller: dosau,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Độ sâu hiện tại",
                    labelText: "Độ sâu hiện tại",
                  ),
                  style: const TextStyle(fontSize: 20.0)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  double _infoDoSau = double.parse(dosau.text);

                  Navigator.pop(context, _infoDoSau);
                },
                child: const Text('Tính toán'),
              ),
            ),
          ]),
    );
  }
}
