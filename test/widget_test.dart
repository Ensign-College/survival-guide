import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survival_guide/main.dart';

void main() {
  group('Home screen test', () {
    testWidgets('MyApp initializes and displays MyHomePage with expected title', (WidgetTester tester) async {

      // Load environment variables for testing
      await dotenv.load();

      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Wait for all animations or async functions to finish
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 5));

      // Verify that the title on the home page is as expected.
      expect(find.text('Welcome to Ensign College'), findsOneWidget);

      // Check if the AppBar's actions include both list and grid icons.
      expect(find.byIcon(Icons.list), findsOneWidget);
      expect(find.byIcon(Icons.grid_on), findsOneWidget);

      // Check if the FloatingActionButton with title 'Search' exists.
      expect(find.text('Search'), findsOneWidget);
    });
  });
}
