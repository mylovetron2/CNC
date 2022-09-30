import 'package:cnc/bu_rongroc_dosau.dart';
import 'package:cnc/rocap_theo_dientro.dart';
import 'package:cnc/taikeo_chophep_khi_ket_mut.dart';
import 'package:cnc/taitrong_theo_dosau_page.dart';
import 'package:cnc/depth_theo_do_giancap.dart';
import 'package:cnc/tham_so_cap_page.dart';
import 'package:cnc/tham_so_may.dart';
import 'package:flutter/material.dart';
import 'mainmenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tính toán CNC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tính toán CNC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _name = [
    'Tính tải trọng máy và cáp theo độ sâu',
    'Tính tải kéo cho phép khi kẹt, mút',
    'Tính độ sâu theo độ giãn cáp',
    'Tính hệ số bù ròng rọc độ sâu(endcoder)',
    'Tính điểm chập/rò cáp theo điện trở',
    'Tính tải trọng theo độ mòn của cáp',
    'Tính độ dài cáp theo điện trở',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          MainMenu(),
        ],
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) {
          String name = _name[i];
          return ListTile(
            title: Card(
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.green, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              shadowColor: Colors.blueGrey,
              elevation: 5,
              //child: Text('$name')),

              child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          // borderRadius: BorderRadius.only(
                          //     topLeft: Radius.circular(12),
                          //     topRight: Radius.circular(12))
                        ),
                        alignment: Alignment.topLeft,
                        child:
                            Text('$name', style: const TextStyle(fontSize: 20)),
                      ),
                    ],
                  )),
            ),
            onTap: () => actionItemSelect(i),
          );
        },
        itemCount: _name.length,
      ),
    );
  }

  actionItemSelect(int value) {
    //print(value);
    switch (value) {
      case 0:
        infoThamSoCap _info2 = infoThamSoCap(
          duongkinhcap: 12,
          trongluongcap: 583,
          hesodientich: 0.95,
          titrong: 1.2,
          hesogiancap: 0.0138,
        );
        infoThamSoMay _infoThamSoMay =
            infoThamSoMay(chieudai: 3.00, khoiluong: 100, duongkinh: 92);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => TaiTrongTheoDoSau(
                  infomation: _info2,
                  informationThamSoMay: _infoThamSoMay,
                  inforDepth: 3000,
                )));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const TaiKeoKhiKetMut()));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const DepthTheoGianCap()));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const BuRongRocDoSau()));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const RoCapTheoDienTro()));
        break;
    }
  }
}
