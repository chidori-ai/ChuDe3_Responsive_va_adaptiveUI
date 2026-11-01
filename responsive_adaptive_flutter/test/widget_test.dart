import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_adaptive_flutter/app.dart';

void main() {
  for (final width in [
    360.0,
    599.0,
    600.0,
    760.0,
    899.0,
    900.0,
    1000.0,
    1200.0,
    1600.0,
  ]) {
    testWidgets('Dashboard fits a ${width.toInt()} logical pixel window', (
      tester,
    ) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = Size(width, 900);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const ResponsiveAdaptiveApp());
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.text('Tổng quan công việc'), findsOneWidget);
      if (width < 600) {
        expect(find.byType(NavigationBar), findsOneWidget);
        expect(find.byType(NavigationRail), findsNothing);
      } else {
        expect(find.byType(NavigationBar), findsNothing);
        final rail = tester.widget<NavigationRail>(find.byType(NavigationRail));
        expect(rail.extended, width >= 900);
      }
    });
  }

  testWidgets(
    'Selected destination survives a switch from bottom bar to rail',
    (tester) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(390, 844);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const ResponsiveAdaptiveApp());
      await tester.pumpAndSettle();
      await tester.tap(find.text('Cài đặt'));
      await tester.pumpAndSettle();
      expect(
        tester.widget<NavigationBar>(find.byType(NavigationBar)).selectedIndex,
        3,
      );
      tester.view.physicalSize = const Size(1400, 900);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(
        tester
            .widget<NavigationRail>(find.byType(NavigationRail))
            .selectedIndex,
        3,
      );
    },
  );

  testWidgets('Content uses its available width at the desktop breakpoint',
      (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(900, 900);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const ResponsiveAdaptiveApp());
    await tester.pumpAndSettle();
    final grids = tester.widgetList<GridView>(find.byType(GridView));
    for (final grid in grids) {
      final delegate =
          grid.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      expect(delegate.crossAxisCount, 2);
    }
    expect(find.text('Chiều rộng cửa sổ: 900 logical px'), findsOneWidget);
    expect(find.text('Chiều rộng nội dung: 615 logical px'), findsOneWidget);
    expect(find.text('Số cột nội dung: 2'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
