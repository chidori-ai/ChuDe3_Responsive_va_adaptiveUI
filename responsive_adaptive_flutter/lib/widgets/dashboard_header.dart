import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 520;
        final title = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Xin chào!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              'Theo dõi tiến độ công việc của bạn.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black54,
                  ),
            ),
          ],
        );

        final avatar = const CircleAvatar(
          radius: 22,
          child: Icon(Icons.person_outline),
        );

        if (compact) {
          return Row(
            children: [
              Expanded(child: title),
              const SizedBox(width: 12),
              avatar,
            ],
          );
        }

        return Row(
          children: [
            Expanded(child: title),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.calendar_month_outlined),
              label: const Text('Tháng này'),
            ),
            const SizedBox(width: 16),
            avatar,
          ],
        );
      },
    );
  }
}
