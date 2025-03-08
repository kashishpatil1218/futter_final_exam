import 'package:cloud_firestore/cloud_firestore.dart';


import '../core/task_modal.dart';
import 'db_service.dart';

class FireStoreServices {
  FireStoreServices._();

  static FireStoreServices fbServices = FireStoreServices._();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // SYNC
  Future<void> syncWithFirebase() async {
    final recordList = await _firestore.collection('tasks').get();
    final db = await DbServices.dbServices.database;

    final localTaskList = await db.query('tasks');
    final localTaskIds = localTaskList.map((task) => task['id']).toSet();

    for (var doc in recordList.docs) {
      final currentTask = doc.data();
      final taskId = currentTask['id'];

      if (!localTaskIds.contains(taskId)) {
        Task task = Task(
          id: currentTask['id'],
          title: currentTask['title'],
          description: currentTask['description'],
          dueDate: currentTask['dueDate'],
          priority: currentTask['priority'],
          status: currentTask['status'],
        );
        await DbServices.dbServices.insertRecord(task);
      }
    }
  }

// FETCH
  Future<void> backUpToFirebase() async {
    final records = await DbServices.dbServices.fetchAllRecord();
    final batch = _firestore.batch();

    for (var task in records) {
      final id = task['id'].toString();
      final ref = _firestore.collection('tasks').doc(id);

      batch.set(ref, task, SetOptions(merge: true));
    }

    await batch.commit();
  }}
