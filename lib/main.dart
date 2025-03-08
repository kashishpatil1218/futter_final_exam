import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:futter_final_exam/provider/task_provider.dart';
import 'package:futter_final_exam/screen/home_page.dart';
import 'package:futter_final_exam/screen/todoApp.dart';

import 'package:provider/provider.dart';

import 'firebase_options.dart';

// 1. TodoApp()

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initNotifications();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // TODOAPP PROVIDER
        ChangeNotifierProvider(create: (context) => TaskProvider(), lazy: false, child: const TodoApp(),),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoApp(),
      ),
    );
  }
}
