import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RoCapTheoDienTro extends StatefulWidget {
  const RoCapTheoDienTro({Key? key}) : super(key: key);

  @override
  State<RoCapTheoDienTro> createState() => _RoCapTheoDienTroState();
}

class _RoCapTheoDienTroState extends State<RoCapTheoDienTro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("XÁC ĐỊNH ĐIỂM RÒ CÁP")),
      body: ListView(
        children: [
          Card(
            color: Colors.blue,
            child: InkWell(
                onTap: () {
                  print('ONTAP');
                },
                child: const Text('test')),
          ),
          SizedBox(
            height: 1000,
          ),
          Card(
            color: Colors.blue,
            child: Text('test2'),
          )
        ],
      ),
    );
  }
}
