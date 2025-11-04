import 'package:flutter_test/flutter_test.dart';
import 'package:mini_cheff/src/core/theme/app_theme.dart';

void main() {
  test('light and dark themes should use Material 3', () {
    final theme = AppTheme();
    expect(theme.lightTheme.useMaterial3, true);
    expect(theme.darkTheme.useMaterial3, true);
  });
}
