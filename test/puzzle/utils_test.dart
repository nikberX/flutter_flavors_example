import 'package:flutter_flavors_example/puzzle/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('returns true if lights-out complete', () {
    final List<List<bool>> completeLightsOutMatrix = [
      [true, true, true],
      [true, true, true],
      [true, true, true],
    ];
    final isComplete = checkLightsOutComplete(completeLightsOutMatrix);
    expect(isComplete, true);
  });

  test('returns false if lights-out not complete', () {
    final List<List<bool>> notCompleteLightsOutMatrix = [
      [true, true, true],
      [true, false, true],
      [true, true, true],
    ];
    final isComplete = checkLightsOutComplete(notCompleteLightsOutMatrix);
    expect(isComplete, false);
  });
}
