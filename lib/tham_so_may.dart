import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ThamSoMay extends StatefulWidget {
  const ThamSoMay({Key? key}) : super(key: key);

  @override
  State<ThamSoMay> createState() => _ThamSoMayState();
}

class _ThamSoMayState extends State<ThamSoMay> {
  TextEditingController chieudai = TextEditingController()..text = '3.00';
  TextEditingController khoiluong = TextEditingController()..text = '100';
  TextEditingController duongkinh = TextEditingController()..text = '92';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TÍNH THAM SỐ MÁY")),
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
                  controller: chieudai,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Chiều dài máy(M)",
                    labelText: "Chiều dài máy(M)",
                  ),
                  style: const TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: khoiluong,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Khối lượng máy trong dung dịch(L)",
                    labelText: "Khối lượng máy trong dung dịch(L)",
                  ),
                  style: const TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: duongkinh,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Đường kính trung bình của máy(MM)",
                    labelText: "Đường kính trung bình của máy(MM)",
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
                  infoThamSoMay _infoThamSoMay = infoThamSoMay(
                    chieudai: double.parse(chieudai.text),
                    khoiluong: double.parse(khoiluong.text),
                    duongkinh: double.parse(duongkinh.text),
                  );

                  Navigator.pop(context, _infoThamSoMay);
                },
                child: const Text('Tính toán'),
              ),
            ),
          ]),
    );
  }
}

class infoThamSoMay {
  double chieudai;
  double khoiluong;
  double duongkinh;

  infoThamSoMay({
    required this.chieudai,
    required this.khoiluong,
    required this.duongkinh,
  });
}
