import 'package:floor/floor.dart';

@dao
abstract class TaskDao {

  @Query("SELECT * FROM tasks_table WHERE category=:category")
  Future<List<TaskModel>> getAllTask(String category);

  @insert
  Future<void> insertTask(TaskModel model);
}