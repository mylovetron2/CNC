import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BuRongRocDoSau extends StatefulWidget {
  const BuRongRocDoSau({Key? key}) : super(key: key);

  @override
  State<BuRongRocDoSau> createState() => _BuRongRocDoSauState();
}

class _BuRongRocDoSauState extends State<BuRongRocDoSau> {
  TextEditingController giasoDoSauHienTai = TextEditingController()
    ..text = '2000';
  TextEditingController giasoDoSauDung = TextEditingController()..text = '1990';
  TextEditingController chuviEncoder = TextEditingController()..text = '0.6096';
  TextEditingController soxungvong = TextEditingController()..text = '1200';
  TextEditingController soxung = TextEditingController()..text = '3937007.874';
  String _resultChuViThucTe = '';
  String _resultHeSoBu = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tính Hệ số bù ròng rọc độ sâu")),
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
                  controller: giasoDoSauHienTai,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Gia số Độ sâu hiện tại",
                    labelText: "Gia số Độ sâu hiện tại",
                  ),
                  style: const TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: giasoDoSauDung,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Gia số Độ sâu đúng",
                    labelText: "Gia số Độ sâu đúng",
                  ),
                  style: const TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: chuviEncoder,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Chu vi Encoder theo tài liệu",
                    labelText: "Chu vi Encoder theo tài liệu",
                  ),
                  style: const TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: soxungvong,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Số xung/vòng",
                    labelText: "Số xung/vòng",
                  ),
                  style: const TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: soxung,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Số xung",
                    labelText: "Số xung",
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
                  setState(() {
                    double temp;
                    temp = double.parse(giasoDoSauDung.text) /
                        (double.parse(soxung.text) /
                            double.parse(soxungvong.text));
                    _resultChuViThucTe = temp.toStringAsFixed(2);
                    temp = double.parse(chuviEncoder.text) / temp;
                    _resultHeSoBu = temp.toStringAsFixed(2);
                  });
                },
                child: const Text('Tính toán'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Chu vi thực tế : $_resultChuViThucTe",
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Hệ số bù độ sâu do mòn chu vi encoder: $_resultHeSoBu",
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ]),
    );
  }
}
