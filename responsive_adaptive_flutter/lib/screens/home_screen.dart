import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import '../widgets/adaptive_navigation.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/summary_card.dart';
import '../widgets/task_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // 1. MEDIA QUERY: Lấy kích thước toàn màn hình
    final screenSize = MediaQuery.sizeOf(context);
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        // 2. LAYOUT BUILDER: Lấy chiều rộng không gian hiện tại
        final width = constraints.maxWidth;

        // 3. BREAKPOINT: Xác định loại màn hình
        final screenType = Responsive.screenType(width);
        final isMobile = screenType == ScreenType.mobile;
        final isDesktop = screenType == ScreenType.desktop;

        final content = _buildContent(
          context,
          width,
          screenWidth,
          screenHeight,
        );

        return Scaffold(
          body: SafeArea(
            child: Row(
              children: [
                if (!isMobile) ...[
                  AdaptiveNavigation(
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (index) {
                      setState(() => selectedIndex = index);
                    },
                    isDesktop: isDesktop,
                  ),
                  const VerticalDivider(width: 1, thickness: 1),
                ],
                Expanded(child: content),
              ],
            ),
          ),
          bottomNavigationBar: isMobile
              ? NavigationBar(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() => selectedIndex = index);
                  },
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.dashboard_outlined),
                      selectedIcon: Icon(Icons.dashboard),
                      label: 'Tổng quan',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.task_alt_outlined),
                      selectedIcon: Icon(Icons.task_alt),
                      label: 'Công việc',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.analytics_outlined),
                      selectedIcon: Icon(Icons.analytics),
                      label: 'Thống kê',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.settings_outlined),
                      selectedIcon: Icon(Icons.settings),
                      label: 'Cài đặt',
                    ),
                  ],
                )
              : null,
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    double width,
    double screenWidth,
    double screenHeight,
  ) {
    final screenType = Responsive.screenType(width);

    final typeName = switch (screenType) {
      ScreenType.mobile => 'Mobile',
      ScreenType.tablet => 'Tablet',
      ScreenType.desktop => 'Desktop',
    };

    return SingleChildScrollView(
      padding: Responsive.pagePadding(width),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DashboardHeader(),
              const SizedBox(height: 28),

              Text(
                'Tổng quan công việc',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 14),

              // 4. LAYOUT BUILDER: Chọn số cột theo không gian khả dụng
              LayoutBuilder(
                builder: (context, constraints) {
                  final columns = Responsive.gridColumns(constraints.maxWidth);

                  return GridView.count(
                    crossAxisCount: columns,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio:
                        screenType == ScreenType.mobile ? 1.55 : 1.7,
                    children: const [
                      SummaryCard(
                        title: 'Tổng công việc',
                        value: '12',
                        subtitle: '+2 so với tuần trước',
                        icon: Icons.assignment_outlined,
                        color: Color(0xFF536DFE),
                      ),
                      SummaryCard(
                        title: 'Đang thực hiện',
                        value: '05',
                        subtitle: 'Cần tiếp tục theo dõi',
                        icon: Icons.pending_actions_outlined,
                        color: Color(0xFFE39A28),
                      ),
                      SummaryCard(
                        title: 'Đã hoàn thành',
                        value: '07',
                        subtitle: '58% tổng công việc',
                        icon: Icons.task_alt,
                        color: Color(0xFF16A085),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 28),

              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Danh sách công việc',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('Thêm mới'),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              const TaskGrid(),

              const SizedBox(height: 24),

              // 5. HIỂN THỊ THÔNG TIN RESPONSIVE
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'THÔNG TIN RESPONSIVE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Chiều rộng màn hình: '
                      '${screenWidth.toStringAsFixed(0)} px',
                    ),
                    Text(
                      'Chiều cao màn hình: '
                      '${screenHeight.toStringAsFixed(0)} px',
                    ),
                    Text(
                      'Chiều rộng khả dụng: '
                      '${width.toStringAsFixed(0)} px',
                    ),
                    Text('Chế độ hiển thị: $typeName'),
                    Text(
                      'Breakpoint: <600 / 600–899 / ≥900 px',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
