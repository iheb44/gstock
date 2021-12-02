import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'user.dart';

class userDatabase {
  static final instance = userDatabase._init();

  static Database? _database;

  userDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filePath);
    return (openDatabase(path, version: 1, onCreate: _createDB));
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $tableUsers ( 
      ${Userfiled.id} $idType,
      ${Userfiled.username} $textType,
      ${Userfiled.password} $textType,
      ${Userfiled.phone} $textType

    )''');
  }

  Future<User> getbyUsername(String Username, String pass) async {
    final db = await instance.database;
    final maps = await db.query(tableUsers,
        columns: Userfiled.values,
        where: '  ${Userfiled.username} = ? and ${Userfiled.password} = ?',
        whereArgs: [Username, pass]);
    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception('user : $Username not found');
    }
  }

  Future Close() async {
    final db = await instance.database;
    db.close();
  }

  Future<User> create(User User) async {
    final db = await instance.database;

    final id = await db.insert(tableUsers, User.toJson());
    return User.copy(id: id);
  }
}
