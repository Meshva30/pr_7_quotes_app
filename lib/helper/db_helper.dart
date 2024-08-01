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

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE quotes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        quote TEXT,
        author TEXT,
        category TEXT
      )
    ''');
    print("Table created");

    await db.execute('''
      CREATE TABLE liked_quotes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        quote_id INTEGER,
        FOREIGN KEY (quote_id) REFERENCES quotes (id)
      )
    ''');
    print("Additional table created");
  }

  Future<void> addCategoryColumn() async {
    final db = await database;

    var result = await db.rawQuery(" table_info(quotes)");
    bool columnExists = result.any((column) => column['name'] == 'category');

    if (!columnExists) {
      await db.execute('''
        ALTER TABLE quotes
        ADD COLUMN category TEXT
      ''');
      print("Category column added");
    }
  }

  Future<void> insertQuote(Quote quote) async {
    final db = await database;
    await db.insert(
      'quotes',
      quote.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("Quote inserted: ${quote.toMap()}");
  }

  Future<List<Quote>> fetchQuotes() async {
    final db = await database;
    final result = await db.query('quotes');
    print("Fetched quotes: $result");
    return result.map((json) => Quote.fromMap(json)).toList();
  }
}
