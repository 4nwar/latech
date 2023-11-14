import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../models/News_detail.dart';

class NewsDatabase {
  static final NewsDatabase instance = NewsDatabase._init();

  static Database? _database;

  
  static const tableBookmark = 'bookmark';
  static const columnId = 'id';
  static const columnTitle = 'title';
  static const columnImg = 'img';
  static const columnWriter = 'writer';
  static const columnDate = 'date';
  static const columnContent = 'content';
  static const columnIsBookmark = 'is_bookmark';

  NewsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('news_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableBookmark (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnTitle TEXT NOT NULL,
        $columnImg TEXT NOT NULL,
        $columnWriter TEXT NOT NULL,
        $columnDate TEXT NOT NULL,
        $columnContent TEXT NOT NULL,
        $columnIsBookmark TEXT DEFAULT 'false'
      )
    ''');
  }

  // insert
  Future<void> insertBookmark(NewsDetailModel newsDetailModel) async {
    final db = await NewsDatabase.instance.database;

    await db.insert(
      NewsDatabase.tableBookmark,
      {
        "title": newsDetailModel.title,
        "img": newsDetailModel.img,
        "writer": newsDetailModel.writer,
        "date": newsDetailModel.date,
        "content": newsDetailModel.content,
        "is_bookmark": 'false', // Provide a default value
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // baca
  Future<List<NewsDetailModel>> getBookmarks() async {
    final db = await NewsDatabase.instance.database;

    final List<Map<String, dynamic>> maps =
        await db.query(NewsDatabase.tableBookmark);
    return maps.map((map) => NewsDetailModel.fromJson(map)).toList();
  }

  //hapus
  Future<void> deleteBookmark(String title) async {
    final db = await NewsDatabase.instance.database;

    await db.delete(
      NewsDatabase.tableBookmark,
      where: '${NewsDatabase.columnId} = ?',
      whereArgs: [title],
    );
  }

  //cek
  Future<bool> isBookmarkExists(String title) async {
    final db = await NewsDatabase.instance.database;

    final List<Map<String, dynamic>> result = await db.query(
      NewsDatabase.tableBookmark,
      where: '${NewsDatabase.columnTitle} = ?',
      whereArgs: [title],
    );

    return result.isNotEmpty; // Check if there is at least one record
  }

  Future<void> close() async {
    if (_database != null && _database!.isOpen) {
      await _database!.close();
    }
  }
}
