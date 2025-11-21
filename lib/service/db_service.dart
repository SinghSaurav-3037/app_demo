import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/academy_list_model.dart';

/// DBService: singleton wrapper around sqflite to store ProjectModel
class DBService {
  static final DBService _instance = DBService._internal();
  factory DBService() => _instance;
  DBService._internal();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'projects.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE projects(
            project_name TEXT,
            name TEXT PRIMARY KEY,
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

  Future<void> insertProject(AcademyListModel project) async {
    final db = await database;
    await db.insert(
      'projects',
      project.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertProjects(List<AcademyListModel> projects) async {
    final db = await database;
    final batch = db.batch();
    for (var p in projects) {
      batch.insert('projects', p.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
  }

  Future<List<AcademyListModel>> getProjects() async {
    final db = await database;
    final rows = await db.query('projects', orderBy: 'project_name COLLATE NOCASE');
    return rows.map((r) => AcademyListModel.fromJson(r)).toList();
  }

  Future<void> clearProjects() async {
    final db = await database;
    await db.delete('projects');
  }
}
