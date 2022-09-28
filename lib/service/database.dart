import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class SemBastDB {
  late Database _database;
  final StoreRef _storeRef;
  final String path;

  SemBastDB(this.path) : _storeRef = StoreRef.main();

  Future<void> open() async {
    late DatabaseFactory dbFactory;
    if (kIsWeb) {
      dbFactory = databaseFactoryWeb;
    } else {
      dbFactory = databaseFactoryIo;
    }
    String dbPath = path;
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      Directory directory = await getApplicationDocumentsDirectory();
      dbPath = join(directory.path, path);
    }
    _database = await dbFactory.openDatabase(dbPath);
  }

  Future<bool> save(String id, dynamic object) async {
    await _storeRef.record(id).put(_database, object);
    return true;
  }

  Future<dynamic> get(
      String id,
      ) async {
    return await _storeRef.record(id).get(
      _database,
    );
  }

  Future<bool> delete(
      String id,
      ) async {
    await _storeRef.record(id).delete(
      _database,
    );
    return true;
  }

  void close() {
    _database.close();
  }
}