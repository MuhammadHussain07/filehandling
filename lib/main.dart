import 'dart:io';

import 'package:file_handlin/load_assets.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                await _localPath;
              },
              child: Text('Get Path')),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                await _localFile;
              },
              child: Text('Create File')),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                await writeData('this is a file');
              },
              child: Text('Write File')),
          SizedBox(
            height: 30,
          ),
          // ElevatedButton(
          //     onPressed: () async {
          //       final path = await _localPath;
          //       return File('$path/message.txt');
          //     },
          //     child: Text('Write Data')),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                print("read string");
                await readString();
                // var data = await rootBundle.load('assets/info.txt');
                // print(data);
              },
              child: Text('Read Data')),
          SizedBox(
            height: 300,
          ),
          InkWell(
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Load_assets()));
              }),
              child: Text('Next Page'))
        ],
      )),
    );
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  File file = File('$path/message.txt');
  return file.create();
}

Future<File> writeData(String message) async {
  final file = await _localFile;

  // Write the file
  return file.writeAsString('$message');
}

Future<String> readString() async {
  try {
    final file = await _localFile;

    // Read the file
    final contents = await file.readAsString();
    print(contents);
    return (contents);
  } catch (e) {
    // If encountering an error, return 0
    print(e);
    return '';
  }
}
