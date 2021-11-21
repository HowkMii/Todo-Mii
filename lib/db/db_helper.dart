import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '/models/task.dart';

class DBHelper {
  static Database _db;
  static final int _version = 1;
  static final String _tableName = 'tasks';
}
