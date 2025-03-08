import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:futter_final_exam/core/task_modal.dart';

import 'package:provider/provider.dart';

import '../service/firestrore_service.dart';
import 'auth/signIn.dart';
import 'component/add_task_button.dart';
import 'component/build_ask_widget.dart';
import '../provider/task_provider.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo Tasks',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          // SYNC
          IconButton(
            onPressed: () async {
              final result = await Connectivity().checkConnectivity();

              if (result == ConnectivityResult.mobile ||
                  result == ConnectivityResult.wifi) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Syncing with firebase...')),
                );
                await context.read<TaskProvider>().syncTask();
                ScaffoldMessenger.of(context).clearSnackBars();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('You are offline!!!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            icon: const Icon(Icons.sync),
          ),

          // BACKUP TO FIREBASE OPTION
          IconButton(
            onPressed: () async {
              final result = await Connectivity().checkConnectivity();

              if (result == ConnectivityResult.mobile ||
                  result == ConnectivityResult.wifi) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Backing up to firebase...')),
                );
                await FireStoreServices.fbServices.backUpToFirebase();
                ScaffoldMessenger.of(context).clearSnackBars();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('You are offline!!!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            icon: const Icon(Icons.cloud_upload),
          ),

          // Logout
          // IconButton(
          //   onPressed: () async {
          //     final res = await AuthService.authService.signOutUser();
          //     if (res) {
          //       Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => const SignIn(),
          //           ));
          //     }
          //   },
          //   icon: const Icon(Icons.logout),
          // ),
        ],
      ),

      // BODY
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Medium')),
              ElevatedButton(onPressed: () {}, child: Text('low')),
              ElevatedButton(onPressed: () {}, child: Text('hight')),
            ],
          ),
          // ADD TASK BUTTON
          const AddTaskButton(),

          // ALL TASKS
          Expanded(
            child: FutureBuilder(
              future: context.read<TaskProvider>().fetchTasksFromDb(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Consumer<TaskProvider>(
                    builder: (context, provider, child) {
                      if (provider.taskList.isNotEmpty) {
                        return ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          itemCount: provider.taskList.length,
                          itemBuilder: (context, index) {
                            return BuildTaskWidget(
                              task: provider.taskList[index],
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text('No task found'));
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
