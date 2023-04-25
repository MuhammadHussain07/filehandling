import 'dart:typed_data';

import 'package:file_handlin/locationpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Load_assets extends StatefulWidget {
  const Load_assets({super.key});

  @override
  State<Load_assets> createState() => _Loaad_assetsState();
}

class _Loaad_assetsState extends State<Load_assets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                await loadassets();
              },
              child: Text('Root Load Asset')),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LocationPage()));
              },
              child: Text('Goto Location Page'))
        ],
      ),
    ));
  }
}

Future<ByteData> loadassets() async {
  var data = await rootBundle.load('assets/info.txt');
  return data;
}
