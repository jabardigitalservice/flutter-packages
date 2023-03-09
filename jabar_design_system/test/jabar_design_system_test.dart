import 'package:flutter_test/flutter_test.dart';
import 'package:jabar_design_system/jabar_design_system.dart';

void main() {
  group('Test colors:', () {
    test('primaries', () {
      const primaryBlue = 4280191205;
      const primaryYellow = 4294955046;
      const primaryGreen = 4279674716;

      expect(Jds.colors.primary.blue.value, primaryBlue);
      expect(Jds.colors.primary.yellow.value, primaryYellow);
      expect(Jds.colors.primary.green.value, primaryGreen);
    });
  });
}
