import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

/*void main() {
  runApp(
    MaterialApp(
      title: 'Reading and Writing Files',
      home: FlutterDemo(storage: CounterStorage()),
    ),
  );
}*/

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<File> get _localFileObj async {
    final path = await _localPath;
    return File('$path/cart.json');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<String> readObj() async {
    try {
      final file = await _localFileObj;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return "null";
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }

  Future<File> writeObj(String object) async {
    final file = await _localFileObj;

    // Write the file
    return file.writeAsString(object);
  }
}

class FlutterDemo extends StatefulWidget {
  final CounterStorage storage;

  const FlutterDemo({Key? key, required this.storage}) : super(key: key);

  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter = 0;
  final String _reference = "A 380";
  String _stringObj = "";

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
    widget.storage.readObj().then((String value) {
      setState(() {
        _stringObj = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_counter);
  }

  Future<File> _addObj() {
    setState(() {
      _counter++;
      // _stringObj = '';
      if (_stringObj == '')
      {
        _stringObj = '''[''';
      }
      else
      {
        if (_stringObj.length > 1)
        {
          _stringObj = _stringObj.substring(0, _stringObj.length - 1) + ''', ''';
        }
        _stringObj = _stringObj + '''{"reference" : "'$_reference'", "quantity" : $_counter}]''';
      }
    });

    // Write the variable as a string to the file.
    return widget.storage.writeObj(_stringObj);
  }

  @override
  Widget build(BuildContext context) {
    // print(_stringObj);
    // print(jsonDecode(_stringObj).runtimeType);
    return Scaffold(
      appBar: AppBar(title: const Text('Reading and Writing Files')),
      body: Center(
        child: Text(
          'Button tapped $_counter time${_counter == 1 ? '' : 's'}.\nString obj : $_stringObj',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addObj,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
