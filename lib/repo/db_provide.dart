import 'package:flutter_news_app_bloc/models/item-model.dart';
import 'package:flutter_news_app_bloc/repo/sources.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class _DbProvider implements Sources, Cache {
  static const db_name = 'news_item.db';
  Database db;
  static const TABLE_NAME = 'ITEMS';

  _DbProvider() {
    init();
  }

  init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, db_name);

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database database, int version) {
        Batch batch = database.batch();
        batch.execute("""
      CREATE TABLE ITEMS
      (
      id INTEGER PRIMARY KEY,
      by TEXT,
      descendants INTEGER,
      score INTEGER,
      text TEXT,
      time INTEGER,
      title TEXT,
      type TEXT,
      url TEXT,
      kids BLOB,
      deleted INTEGER,
      dead INTEGER,
      parent INTEGER
      )
      """);
        batch.commit();
      },
    );
  }

  @override
  insertItem(ItemModel itemModel) {
    return db.insert(
      'Items',
      itemModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    //insert into Items() values()
  }

  @override
  Future<ItemModel> fetchItem(int id) async {
    final data = await db.query(
      'Items',
      columns: ['*'],
      where: "id= ?",
      whereArgs: [id],
    );
    return data.length > 0 ? ItemModel.fromDB(data.first) : null;
  }

  @override
  Future<List<int>> fetchTopIds() {
    // TODO: implement fetchTopIds
    return null;
  }

  @override
  Future<int> clearData() async {
    db.delete(TABLE_NAME);
  }
}

final dbProvider = _DbProvider();
