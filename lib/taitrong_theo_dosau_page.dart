import 'package:cnc/tham_so_cap_page.dart';
import 'package:cnc/tham_so_may.dart';
import 'package:cnc/tinh_tai.dart';

import 'package:flutter/material.dart';
import 'dart:math';

class TaiTrongTheoDoSau extends StatefulWidget {
  const TaiTrongTheoDoSau(
      {Key? key,
      required this.infomation,
      required this.informationThamSoMay,
      required this.inforDepth})
      : super(key: key);

  final infoThamSoCap infomation;
  final infoThamSoMay informationThamSoMay;
  final double inforDepth;

  @override
  State<TaiTrongTheoDoSau> createState() => _TaiTrongTheoDoSauState();
}

class _TaiTrongTheoDoSauState extends State<TaiTrongTheoDoSau> {
  late infoThamSoCap
      info; //= infoThamSoCap(trongluongcap: 100, duongkinhcap: 100);
  late infoThamSoMay info_thamsomay;
  double info_depth = 0;

  @override
  void initState() {
    info = infoThamSoCap(
        trongluongcap: widget.infomation.trongluongcap,
        duongkinhcap: widget.infomation.duongkinhcap,
        hesodientich: widget.infomation.hesodientich,
        titrong: widget.infomation.titrong,
        hesogiancap: widget.infomation.hesogiancap);

    info_thamsomay = infoThamSoMay(
      chieudai: widget.informationThamSoMay.chieudai,
      khoiluong: widget.informationThamSoMay.khoiluong,
      duongkinh: widget.informationThamSoMay.duongkinh,
    );

    info_depth = widget.inforDepth;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Tính tải trọng máy và cáp theo độ sâu")),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          Card(
            color: Colors.yellowAccent,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: InkWell(
                onTap: () async {
                  //final result = await Navigator.push(B)
                  final temp = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThamSoCap()));

                  setState(() {
                    info = temp;
                    //}
                  });
                },
                child: (widget_thamsocap(info.duongkinhcap, info.trongluongcap,
                    info.hesodientich, info.titrong, info.hesogiancap)),
              ),
            ),
          ),

          //------------Tham so may----------------------------------------------
          Card(
            color: Colors.yellowAccent,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: InkWell(
                onTap: () async {
                  final temp = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThamSoMay()));

                  setState(() {
                    info_thamsomay = temp;
                    //}
                  });
                },
                child: (widget_thamsomay(
                    info_thamsomay.chieudai,
                    info_thamsomay.khoiluong,
                    info_thamsomay.duongkinh,
                    info.titrong)),
              ),
            ),
          ),
          //-------------------------------------------TINH TAI----------------------------------
          Card(
            color: Colors.yellowAccent,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: InkWell(
                onTap: () async {
                  final temp = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const TinhTai()));

                  setState(() {
                    info_depth = temp;
                    //}
                  });
                },
                child: (widget_tinhtai(info_depth, info, info_thamsomay)),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

//--------------------Widget THAM SO CAP------------------------------

Widget widget_thamsocap(double duongkinhcap, double trongluongcap,
    double hesodientich, double titrong, double hesogiancap) {
  const double pi = 3.1415926535897932;
  num thetichcap = pi * pow((((duongkinhcap * hesodientich) / 2)), 2);
  double trongluongDD = (trongluongcap - thetichcap * titrong) / 10;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Tham Số cáp\n',
        style: TextStyle(
            fontSize: 25, color: Colors.blue, fontWeight: FontWeight.bold),
      ),
      Row(children: <Widget>[
        Expanded(
          child: RichText(
            text: TextSpan(
              text: thetichcap.toStringAsFixed(2),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 25),
              children: const <TextSpan>[
                TextSpan(
                    text: '\nThể tích cáp\nlit/1000M',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
            text: trongluongDD.toStringAsFixed(2),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.green, fontSize: 25),
            children: const <TextSpan>[
              TextSpan(
                  text: '\nTrọng lượng 100M cáp\n trong dung dịch',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ]),
      const SizedBox(
        height: 15,
      ),
      Row(
        children: <Widget>[
          const Expanded(
              child: Text(
            'Trọng lượng cáp\n trong không khí Kg/1000M:',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          )),
          Text(
            trongluongcap.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        children: <Widget>[
          const Expanded(
              child: Text(
            'Đường kính cáp:',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          )),
          Text(
            duongkinhcap.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          const Expanded(
              child: Text(
            'Hệ số diện tích thực',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          )),
          Text(
            hesodientich.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          const Expanded(
              child: Text(
            'Tỉ trọng dung dịch',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          )),
          Text(
            titrong.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          const Expanded(
              child: Text(
            'Hệ số dãn cáp M/100/100KG',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          )),
          Text(
            hesogiancap.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          ),
        ],
      ),
    ],
  );
}

//-----------------------THAM SO MAY--------------------------------------

Widget widget_thamsomay(
    double chieudai, double khoiluong, double duongkinh, double titrong) {
  const double pi = 3.1415926535897932;
  double thetichmay = ((duongkinh * duongkinh * pi / 4) * chieudai) / 1000;
  double trongluongmay = khoiluong - thetichmay * titrong / 100;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Tham Số máy\n',
        style: TextStyle(
            fontSize: 25, color: Colors.blue, fontWeight: FontWeight.bold),
      ),
      Row(children: <Widget>[
        Expanded(
          child: RichText(
            text: TextSpan(
              text: thetichmay.toStringAsFixed(2),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 25),
              children: const <TextSpan>[
                TextSpan(
                    text: '\nThể tích máy\ntrong dung dịch',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
            text: trongluongmay.toStringAsFixed(2),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.green, fontSize: 25),
            children: const <TextSpan>[
              TextSpan(
                  text: '\nTrọng lượng máy\ntrong dung dịch',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ]),
      const SizedBox(
        height: 15,
      ),
      Row(
        children: <Widget>[
          const Expanded(
              child: Text(
            'Chiều dài máy(M)',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          )),
          Text(
            chieudai.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          ),
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      Row(
        children: <Widget>[
          const Expanded(
              child: Text(
            'Khối lượng máy trong KK(Kg)',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          )),
          Text(
            khoiluong.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          ),
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      Row(
        children: <Widget>[
          const Expanded(
              child: Text(
            'Đường kính trung bình của máy(MM)',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          )),
          Text(
            duongkinh.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          ),
        ],
      ),
    ],
  );
}
//-----------------------TINH TAI----------------------------------

Widget widget_tinhtai(
    double dosau, infoThamSoCap _infoThamSoCap, infoThamSoMay _infoThamSoMay) {
  double trongluongmay, trongluongcap;

  const double pi = 3.1415926535897932;
  double thetichcap = pi *
      pow((((_infoThamSoCap.duongkinhcap * _infoThamSoCap.hesodientich) / 2)),
          2);
  trongluongcap =
      (_infoThamSoCap.trongluongcap - thetichcap * _infoThamSoCap.titrong) / 10;

  double thetichmay =
      ((_infoThamSoMay.duongkinh * _infoThamSoMay.duongkinh * pi / 4) *
              _infoThamSoMay.chieudai) /
          1000;
  trongluongmay =
      _infoThamSoMay.khoiluong - thetichmay * _infoThamSoCap.titrong / 100;

  double taitrong = trongluongmay + (dosau / 100) * trongluongcap;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Tải\n',
        style: TextStyle(
            fontSize: 25, color: Colors.blue, fontWeight: FontWeight.bold),
      ),
      Row(children: <Widget>[
        Expanded(
          child: RichText(
            text: TextSpan(
              text: taitrong.toStringAsFixed(2),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 25),
              children: const <TextSpan>[
                TextSpan(
                    text: '\nTải trọng tính toán',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
            text: dosau.toStringAsFixed(2),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.green, fontSize: 25),
            children: const <TextSpan>[
              TextSpan(
                  text: '\nĐộ sâu hiện tại',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ]),
      const SizedBox(
        height: 15,
      ),
    ],
  );
}
