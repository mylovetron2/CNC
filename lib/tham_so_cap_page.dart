import 'package:flutter/material.dart';
//import 'package:cnc/taitrong_theo_dosau_page.dart';

class ThamSoCap extends StatefulWidget {
  const ThamSoCap({Key? key}) : super(key: key);

  @override
  State<ThamSoCap> createState() => _ThamSoCapState();
}

class _ThamSoCapState extends State<ThamSoCap> {
  TextEditingController trongluongcap = TextEditingController()..text = '583';
  TextEditingController duongkinhcap = TextEditingController()..text = '12';
  TextEditingController hesodientich = TextEditingController()..text = '0.95';
  TextEditingController titrong = TextEditingController()..text = '1.2';
  TextEditingController hesogiancap = TextEditingController()..text = '0.0138';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TÍNH THAM SỐ CÁP")),
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
                  controller: trongluongcap,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Trọng lượng cáp trong không khí Kg/1000M",
                    labelText: "Trọng lượng cáp trong không khí Kg/1000M",
                  ),
                  style: const TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: duongkinhcap,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Đường kính cáp",
                    labelText: "Đường kính cáp",
                  ),
                  style: const TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: hesodientich,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Hệ số diện tích thực",
                    labelText: "Hệ số diện tích thực",
                  ),
                  style: const TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: titrong,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Tỉ trọng dung dịch",
                    labelText: "Tỉ trọng dung dịch",
                  ),
                  style: const TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: hesogiancap,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Hệ số dãn cáp M/100/100KG",
                    labelText: "Hệ số dãn cáp M/100/100KG",
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
                  infoThamSoCap _info = infoThamSoCap(
                    duongkinhcap: double.parse(duongkinhcap.text),
                    trongluongcap: double.parse(trongluongcap.text),
                    hesodientich: double.parse(hesodientich.text),
                    titrong: double.parse(titrong.text),
                    hesogiancap: double.parse(hesogiancap.text),
                  );

                  Navigator.pop(context, _info);
                },
                child: const Text('Tính toán'),
              ),
            ),
          ]),
    );
  }
}

class infoThamSoCap {
  double trongluongcap;
  double duongkinhcap;
  double hesodientich;
  double titrong;
  double hesogiancap;
  infoThamSoCap(
      {required this.trongluongcap,
      required this.duongkinhcap,
      required this.hesodientich,
      required this.titrong,
      required this.hesogiancap});
}
