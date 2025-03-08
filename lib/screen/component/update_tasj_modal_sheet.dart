import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../core/task_modal.dart';
import '../../provider/task_provider.dart';
import '../utils.dart';

void showUpdateTaskBottomSheet(BuildContext context, Task task) {
  // SHOW MODAL BOTTOM SHEET TO ADD TASK
  showCupertinoModalBottomSheet(
    context: context,
    expand: true,
    useRootNavigator: true,
    builder: (context) => Material(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Update Task',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // TITLE
              buildCustomTextField(
                title: 'Title',
                controller: context.read<TaskProvider>().txtTitle,
              ),

              // DESCRIPTION
              buildCustomTextField(
                title: 'Description',
                controller: context.read<TaskProvider>().txtDescription,
              ),


              // PRIORITY
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  children: [
                    const Text(
                      'Priority',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Selector<TaskProvider, String>(
                      builder: (context, priority, child) => DropdownMenu(
                        width: 160,
                        label: const Text('Priority'),
                        initialSelection: priority,
                        onSelected: (value) {
                          context.read<TaskProvider>().setPriority(value);
                        },
                        dropdownMenuEntries: const <DropdownMenuEntry>[
                          // HIGH
                          DropdownMenuEntry(
                            value: 'High',
                            label: 'High',
                          ),
                          // MEDIUM
                          DropdownMenuEntry(
                            value: 'Medium',
                            label: 'Medium',
                          ),
                          // LOW
                          DropdownMenuEntry(
                            value: 'Low',
                            label: 'Low',
                          ),
                        ],

                      ),
                      selector: (_, provider) => provider.priority,
                    ),
                  ],
                ),
              ),

              // DUE DATE PICKER
              const Padding(
                padding: EdgeInsets.only(top: 12),
                child: Text(
                  'Due date',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ),

              Selector<TaskProvider, DateTime?>(
                selector: (_, provider) => provider.dueDate,
                builder: (context, date, child) => SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              date != null
                                  ? DateFormat('dd MM yyyy, hh:mm a')
                                  .format(date)
                                  : 'Not Set',
                              style:
                              const TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),

                      // PICK DATE TIME BUTTON
                      TextButton(
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2030),
                          );

                          if (pickedDate != null) {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );

                            if (pickedTime != null) {
                              DateTime dateTime = DateTime(
                                pickedDate.year,
                                pickedDate.month,
                                pickedDate.day,
                                pickedTime.hour,
                                pickedTime.minute,
                              );
                              context.read<TaskProvider>().setDueDate(dateTime);
                            }
                          }
                        },
                        child: const Text('Pick date'),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // ADD CANCEL BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // CANCEL BUTTON
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<TaskProvider>().resetControllers();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),

                  // ADD BUTTON
                  ElevatedButton(
                    onPressed: () async {
                      await context.read<TaskProvider>().updateTask(task);
                      Navigator.pop(context);
                      context.read<TaskProvider>().resetControllers();
                    },
                    child: const Text('Update'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Column buildCustomTextField(
    {required String title, required TextEditingController controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Text(
          'Enter Task $title',
          style: const TextStyle(fontWeight: FontWeight.w400),
        ),
      ),
      Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            border: InputBorder.none,
            hintText: title,
            hintStyle: const TextStyle(
                color: secondaryTextColor, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    ],
  );
}
