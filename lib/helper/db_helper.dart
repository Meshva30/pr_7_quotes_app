
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/quotes_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('quotes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE quotes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        quote TEXT,
        author TEXT,
        category TEXT,
        liked INTEGER DEFAULT 0
      )
    ''');
  }

  Future<void> addCategoryColumn() async {
    final db = await database;

    var result = await db.rawQuery("PRAGMA table_info(quotes)");
    bool columnExists = result.any((column) => column['name'] == 'category');

    if (!columnExists) {
      await db.execute('''
        ALTER TABLE quotes
        ADD COLUMN category TEXT
      ''');
    }
  }

  Future<void> insertQuote(Quote quote) async {
    final db = await database;
    await db.insert(
      'quotes',
      quote.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateQuote(Quote quote) async {
    final db = await database;
    await db.update(
      'quotes',
      quote.toMap(),
      where: 'id = ?',
      whereArgs: [quote.id],
    );
  }

  Future<void> updateQuotes(List<Quote> quotes) async {
    final db = await database;
    Batch batch = db.batch();

    for (var quote in quotes) {
      batch.update(
        'quotes',
        quote.toMap(),
        where: 'id = ?',
        whereArgs: [quote.id],
      );
    }

    await batch.commit();
  }

  Future<List<Quote>> fetchQuotes() async {
    final db = await database;
    final result = await db.query('quotes');
    return result.map((json) => Quote.fromMap(json)).toList();
  }

  Future<void> deleteAllQuotes() async {
    final db = await database;
    await db.delete('quotes');
  }

  Future<List<Quote>> fetchLikedQuotes() async {
    final db = await database;
    final result = await db.query(
      'quotes',
      where: 'liked = ?',
      whereArgs: [1],
    );
    return result.map((json) => Quote.fromMap(json)).toList();
  }
}
