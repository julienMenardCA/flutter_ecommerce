import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ShoppingCartStorage {
  final String fileName;

  ShoppingCartStorage({required this.fileName});

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  Future<String> readObj() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return "null";
    }
  }

  Future<File> writeObj(String object) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(object);
  }
}
