import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



import '../../provider/task_provider.dart';
import '../utils.dart';
import 'add_task_modal_sheet.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        context.read<TaskProvider>().resetControllers();
        showAddTaskBottomSheet(context);
      },
      padding: EdgeInsets.zero,
      child: Container(
        height: 60,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(14),

        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ADD TASK',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.add,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
