

import 'dart:developer';

import 'package:flutter/material.dart';


import '../core/task_modal.dart';

import '../service/db_service.dart';
import '../service/firestrore_service.dart';

class TaskProvider extends ChangeNotifier {
  TaskProvider(){
    log("Task provider initialized...");
  }

  List<Task> taskList = [];

  // List<Task> get TaskList => taskList;

  DateTime? dueDate;
  var txtTitle = TextEditingController();
  var txtDescription = TextEditingController();
  String priority = 'Medium';
  int status = 0;


  // SET PRIORITY
  void setPriority(String value){
    priority = value;
    notifyListeners();
  }

  // SET DUE DATE
  void setDueDate(DateTime dateTime){
    dueDate = dateTime;
    notifyListeners();
  }

  // SET STATUS
  Future<void> setStatus(Task task, bool value) async {
    task.status = value ? 1 : 0;
    await DbServices.dbServices.updateRecord(task);
    await fetchTasksFromDb();
    notifyListeners();
  }

  // RESET
  void resetControllers(){
    txtTitle.clear();
    txtDescription.clear();
    priority = 'Medium';
    status = 0;
    dueDate = null;
  }

  // SET
  void setControllers(Task task){
    txtTitle.text = task.title!;
    txtDescription.text = task.description!;
    status = task.status!;
    priority = task.priority!;
    dueDate = DateTime.parse(task.dueDate!);
  }

  // INIT DATABASE AND FETCH TASKS
  Future<List<Task>> fetchTasksFromDb() async {
    final db = await DbServices.dbServices.database;
    final records = await db.query('tasks');
    taskList = records.map(
            (record) {
          return Task.fromJson(record);
        }
    ).toList();

    return taskList;
  }

  // UPDATE
  Future<void> updateTask(Task task) async {
    task.dueDate = dueDate!.toIso8601String();
    task.title = txtTitle.text;
    task.description =
        txtDescription.text;
    task.priority = priority;
    await DbServices.dbServices.updateRecord(task);
    await fetchTasksFromDb();
    notifyListeners();
  }

  // DELETE
  Future<void> deleteTask(int id) async {
    await DbServices.dbServices.deleteRecord(id);
    await fetchTasksFromDb();
    notifyListeners();
  }

  // INSERT
  Future<void> insertTask() async {
    final dateTime = dueDate;
    final title = txtTitle.text;
    final description =
        txtDescription.text;
    if (dateTime != null) {
      Task task = Task(
        title: title,
        description: description,
        dueDate: dateTime.toIso8601String(),
        priority: priority,
      );
      await DbServices.dbServices.insertRecord(task);
      await fetchTasksFromDb();
      notifyListeners();
    }
  }


  // SYNC WITH FIREBASE
  Future<void> syncTask() async {
    await FireStoreServices.fbServices.syncWithFirebase();
    await fetchTasksFromDb();
    notifyListeners();
  }

  @override
  void dispose() {
    txtTitle.dispose();
    txtDescription.dispose();
    super.dispose();
  }


}
