import 'package:flutter/material.dart';

class TaiKeoKhiKetMut extends StatefulWidget {
  const TaiKeoKhiKetMut({Key? key}) : super(key: key);

  @override
  State<TaiKeoKhiKetMut> createState() => _TaiKeoKhiKetMutState();
}

class _TaiKeoKhiKetMutState extends State<TaiKeoKhiKetMut> {
  TextEditingController taiDiBinhThuong = TextEditingController()
    ..text = '1000';
  TextEditingController lucDutDiemYeu = TextEditingController()..text = '3000';
  TextEditingController taiMayTrongDD = TextEditingController()..text = '200';
  TextEditingController gioiHanChoPhep = TextEditingController()..text = '0.5';

  String _resultTaiChoPhepTrenDauNoi = '';
  String _resultTaiChoPhepTrenMat = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TÍNH TẢI KÉO CHO PHÉP KHI KẸT, MÚT")),
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
                  controller: taiDiBinhThuong,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Tải đi bình thường",
                    labelText: "Tải đi bình thường",
                  ),
                  style: const TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: lucDutDiemYeu,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Lực đứt điểm yếu",
                    labelText: "Lực đứt điểm yếu",
                  ),
                  style: const TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: taiMayTrongDD,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Tải máy trong dung dịch",
                    labelText: "Tải máy trong dung dịch",
                  ),
                  style: const TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: gioiHanChoPhep,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Giới hạn cho phép kéo thêm so với điểm yếu",
                    labelText: "Giới hạn cho phép kéo thêm so với điểm yếu",
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
                    temp = double.parse(lucDutDiemYeu.text) *
                            double.parse(gioiHanChoPhep.text) -
                        double.parse(taiMayTrongDD.text);
                    _resultTaiChoPhepTrenDauNoi = temp.toStringAsFixed(2);
                    temp = double.parse(taiDiBinhThuong.text) + temp;
                    _resultTaiChoPhepTrenMat = temp.toStringAsFixed(2);
                  });
                },
                child: const Text('Tính toán'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Tải cho phép tăng thêm trên đầu nối : $_resultTaiChoPhepTrenDauNoi",
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
                "Tải kéo cho phép trên mặt: $_resultTaiChoPhepTrenMat",
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
