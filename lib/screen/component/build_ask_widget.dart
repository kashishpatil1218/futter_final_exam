//
// import 'package:flutter/material.dart';
// import 'package:futter_final_exam/screen/component/update_tasj_modal_sheet.dart';
// import 'package:provider/provider.dart';
//
// import '../../core/task_modal.dart';
//
// import '../../provider/task_provider.dart';
//
// import '../utils.dart';
//
// class BuildTaskWidget extends StatelessWidget {
//   const BuildTaskWidget({
//     super.key,
//     required this.task,
//   });
//
//   final Task task;
//
//   @override
//   Widget build(BuildContext context) {
//     String title = task.title!;
//     String? description = task.description;
//     bool status = task.status == 0 ? false : true;
//     String? dateTime = task.dueDate;
//     String? priority = task.priority;
//     Color priorityColor = _getPriorityColor(priority!);
//
//     return GestureDetector(
//       onTap: () {
//         context.read<TaskProvider>().setControllers(task);
//         showUpdateTaskBottomSheet(context, task);
//       },
//       child: Container(
//         height: 120,
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: backgroundColor,
//           border: Border.all(
//             color: Colors.black,
//             width: 2,
//           ),
//           // SHADOW
//
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // PRIORITY COLOR
//             Container(
//               width: 8,
//               height: 120,
//
//             ),
//
//             const SizedBox(width: 8),
//
//             // CONTENT
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Row(
//                   children: [
//                     // CONTENT
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // TITLE
//                           Text(
//                             title,
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//
//                           // DESCRIPTION
//                           Text(
//                             description!,
//                             maxLines: 3,
//                             style: const TextStyle(
//                               color: Colors.grey,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 18,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//
//                           // DESCRIPTION
//                           Text(
//                             priority,
//                             maxLines: 3,
//                             style: const TextStyle(
//                               color: Colors.grey,
//                               fontSize: 18,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//
//                           const Spacer(),
//
//                           // DATE - TIME
//                           Text(
//                             dateTime!,
//                             style: const TextStyle(
//                               fontSize: 12,
//                               color: secondaryTextColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     Column(
//                       children: [
//                         // DELETE BUTTON
//                         IconButton(
//                           onPressed: () {
//                             context.read<TaskProvider>().deleteTask(task.id!);
//                           },
//                           icon: const Icon(Icons.delete),
//                         ),
//
//                         // COMPLETION STATUS CHECK BOX
//                         Checkbox(
//
//                           activeColor: Colors.green,
//                           value: status,
//                           onChanged: (value) async {
//                             await context.read<TaskProvider>().setStatus(task, value!);
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Color _getPriorityColor(String value){
//   switch(value){
//     case 'High':
//       return highPriority;
//
//     case 'Medium':
//       return mediumPriority;
//
//     case 'Low':
//       return lowPriority;
//
//     default:
//       return Colors.white;
//   }
// }


import 'package:flutter/material.dart';
import 'package:futter_final_exam/screen/component/update_tasj_modal_sheet.dart';
import 'package:provider/provider.dart';

import '../../core/task_modal.dart';
import '../../provider/task_provider.dart';
import '../utils.dart';

class BuildTaskWidget extends StatelessWidget {
  const BuildTaskWidget({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    String title = task.title!;
    String? description = task.description;
    bool status = task.status == 0 ? false : true;
    String? dateTime = task.dueDate;
    String? priority = task.priority;
    Color priorityColor = _getPriorityColor(priority!);

    return GestureDetector(
      onTap: () {
        context.read<TaskProvider>().setControllers(task);
        showUpdateTaskBottomSheet(context, task);
      },
      child: Container(
        height: 140,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PRIORITY COLOR
            Container(
              width: 8,
              height: 140,

            ),

            const SizedBox(width: 8),

            // CONTENT
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TITLE
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    // DESCRIPTION
                    Text(
                      description!,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),
                    Text(
                      priority!,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    // PROGRESS BAR
                    LinearProgressIndicator(
                      value: status ? 0.2 : 0.0,
                      backgroundColor: Colors.grey[300],
                      color: status ? Colors.green : Colors.orange,
                    ),

                    const Spacer(),

                    // DATE - TIME
                    Text(
                      dateTime!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Column(
              children: [
                // DELETE BUTTON
                IconButton(
                  onPressed: () {
                    context.read<TaskProvider>().deleteTask(task.id!);
                  },
                  icon: const Icon(Icons.delete),
                ),

                // COMPLETION STATUS CHECKBOX
                Checkbox(
                  activeColor: Colors.green,
                  value: status,
                  onChanged: (value) async {
                    await context.read<TaskProvider>().setStatus(task, value!);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Color _getPriorityColor(String value) {
  switch (value) {
    case 'High':
      return highPriority;
    case 'Medium':
      return mediumPriority;
    case 'Low':
      return lowPriority;
    default:
      return Colors.white;
  }
}