import 'package:flutter/material.dart';

class DepthTheoGianCap extends StatefulWidget {
  const DepthTheoGianCap({Key? key}) : super(key: key);

  @override
  State<DepthTheoGianCap> createState() => _DepthTheoGianCapState();
}

class _DepthTheoGianCapState extends State<DepthTheoGianCap> {
  TextEditingController giasoDepth = TextEditingController()..text = '3';
  TextEditingController giasoTension = TextEditingController()..text = '500';
  TextEditingController hesogiancap = TextEditingController()..text = '0.138';
  String _result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tính Depth theo độ giãn cáp")),
      body: Column(
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
                  controller: giasoDepth,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Gia số tăng của DEPTH",
                    labelText: "Gia số tăng của DEPTH",
                  ),
                  style: const TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: giasoTension,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Gia số tăng của Tension",
                    labelText: "Gia số tăng của Tension",
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
                    hintText: "Hệ số gian cáp/100m/1000Kg",
                    labelText: "Hệ số giãn cáp/100m/1000Kg",
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
                    temp = (((double.parse(giasoDepth.text) * 1000) /
                                double.parse(giasoTension.text)) *
                            100) /
                        double.parse(hesogiancap.text);
                    _result = temp.toStringAsFixed(2);
                  });
                },
                child: const Text('Tính toán'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Depth : $_result",
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 19.4,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ]),
    );
  }
}
