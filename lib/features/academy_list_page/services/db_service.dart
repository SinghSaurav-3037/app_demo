import 'package:flutter_app_demo/features/academy_list_page/model/academy_list_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


/// DBService manages all local SQLite database operations.

class DBService {
  static final DBService _instance = DBService._internal();
  factory DBService() => _instance;
  DBService._internal();

  Database? _db;

  ///  To Returns the database instance, creates it if null.
  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  /// Initialize and open the SQLite database
  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath(); // path base
    final path = join(dbPath, 'projects.db'); // DB file name

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        /// Create table for storing projects when DB first installs.
        await db.execute('''
          CREATE TABLE projects(
            project_name TEXT,
            name TEXT PRIMARY KEY,   -- Unique identifier
            area TEXT,
            district TEXT,
            project_type TEXT,
            program TEXT,
            status TEXT
          )
        ''');
      },
    );
  }



  /// To insert record in db and handle data duplicity
  ///    If record already exists with same primary key, override it.
  Future<void> insertProject(AcademyListModel project) async {
    final db = await database;
    await db.insert(
      'projects',
      project.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  ///To Insert multiple records in db
  Future<void> insertProjects(List<AcademyListModel> projects) async {
    final db = await database;
    final batch = db.batch();
    for (var p in projects) {
      batch.insert(
        'projects',
        p.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  /// get all records  from db in offline mode
  Future<List<AcademyListModel>> getProjects() async {
    final db = await database;
    final rows = await db.query(
      'projects',
      orderBy: 'project_name COLLATE NOCASE', // Sorting case-insensitive
    );
    return rows.map((e) => AcademyListModel.fromJson(e)).toList();
  }

  /// Clear db before inserting new data when syncing.
  Future<void> clearProjects() async {
    final db = await database;
    await db.delete('projects');
  }
}
