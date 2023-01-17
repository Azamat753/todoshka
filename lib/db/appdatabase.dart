import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'model/task_model.dart';
part 'appdatabase.g.dart';

@Database(version:1,entities : [TaskModel])
abstract class AppDataBase extends FloorDatabase {
  TaskDao get taskDao;
}
