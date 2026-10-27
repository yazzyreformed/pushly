import 'package:flutter_test/flutter_test.dart';
import 'package:pushly/main.dart';

void main() {
  testWidgets('Ana ekran açılır', (tester) async {
    await tester.pumpWidget(const PushlyApp());
    expect(find.text('Pushly'), findsOneWidget);
    expect(find.text('Bugünkü hedef'), findsOneWidget);
  });
}
