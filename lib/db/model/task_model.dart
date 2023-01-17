import 'package:floor/floor.dart';

@entity
class TaskModel {
  @PrimaryKey(autoGenerate: true) final int? id;
  final String category;
  final String task;
  final bool isDone;
  final int doneAmount;
}
