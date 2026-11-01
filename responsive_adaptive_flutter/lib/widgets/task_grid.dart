import 'package:flutter/material.dart';

import '../data/sample_tasks.dart';
import '../utils/responsive.dart';
import 'task_card.dart';

class TaskGrid extends StatelessWidget {
  const TaskGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = Responsive.gridColumns(constraints.maxWidth);
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: sampleTasks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 270,
          ),
          itemBuilder: (context, index) {
            return TaskCard(task: sampleTasks[index]);
          },
        );
      },
    );
  }
}
