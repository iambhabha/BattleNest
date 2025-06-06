import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ThemeDatabaseService {
  static const _databaseName = 'app_database.db';
  static const _databaseVersion = 1;
  static const table = 'preferences';
  static const columnKey = 'key';
  static const columnValue = 'value';
  static const themeKey = 'theme_mode';

  static Database? _database;
  bool _isInitialized = false;

  // Factory constructor to return the same instance
  factory ThemeDatabaseService() {
    return _instance;
  }
  
  // Private constructor for singleton
  ThemeDatabaseService._internal();
  
  // Singleton instance
  static final ThemeDatabaseService _instance = ThemeDatabaseService._internal();

  // Initialize the database
  Future<void> initialize() async {
    if (_isInitialized) return;
    
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, _databaseName);
    
    // Ensure the directory exists
    try {
      await Directory(databasesPath).create(recursive: true);
    } catch (_) {}
    
    _database = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
    
    _isInitialized = true;
    
    // Ensure the default theme preference exists
    await _ensureDefaultPreferences();
  }

  // Getter for the database
  Future<Database> get database async {
    if (!_isInitialized) {
      await initialize();
    }
    return _database!;
  }

  // Create the database table
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnKey TEXT PRIMARY KEY,
        $columnValue TEXT NOT NULL
      )
    ''');
  }
  
  // Ensure default preferences exist
  Future<void> _ensureDefaultPreferences() async {
    final db = await database;
    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM $table WHERE $columnKey = ?', [themeKey]),
    );
    
    if (count == 0) {
      await db.insert(
        table,
        {
          columnKey: themeKey,
          columnValue: 'system',
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // Get theme mode from database
  Future<String> getThemeMode() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(
        table,
        where: '$columnKey = ?',
        whereArgs: [themeKey],
      );

      if (maps.isNotEmpty) {
        return maps.first[columnValue] as String;
      }
    } catch (e) {
      debugPrint('Error getting theme mode: $e');
    }
    
    // Return default value if not found or error occurs
    return 'system';
  }

  // Save theme mode to database
  Future<void> setThemeMode(String themeMode) async {
    try {
      final db = await database;
      await db.insert(
        table,
        {
          columnKey: themeKey,
          columnValue: themeMode,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      debugPrint('Error setting theme mode: $e');
      rethrow;
    }
  }
}
