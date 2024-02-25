import 'dart:math';

List<List<bool>> generateRandomUnsolvedLightsOutMatrix([
  int dimensions = 3,
  int? seedOverride,
]) {
  final seed = seedOverride ?? DateTime.now().millisecondsSinceEpoch;
  final random = Random(seed);
  final List<List<bool>> matrix = List<List<bool>>.generate(
    dimensions,
    (index) => List<bool>.generate(
      dimensions,
      (index) => random.nextBool(),
    ),
  );
  if (countFilled(matrix) == dimensions * dimensions) {
    matrix[random.nextInt(3)][random.nextInt(3)] = false;
  }
  return matrix;
}

List<List<bool>> placeCell(List<List<bool>> matrix, int row, int coll) {
  matrix[row][coll] = !matrix[row][coll];
  final dimensions = matrix.length;

  if (row - 1 >= 0) {
    matrix[row - 1][coll] = !matrix[row - 1][coll];
  }
  if (row + 1 < dimensions) {
    matrix[row + 1][coll] = !matrix[row + 1][coll];
  }
  if (coll - 1 >= 0) {
    matrix[row][coll - 1] = !matrix[row][coll - 1];
  }
  if (coll + 1 < dimensions) {
    matrix[row][coll + 1] = !matrix[row][coll + 1];
  }
  return matrix;
}

bool checkLightsOutComplete(List<List<bool>> lightsOutMatrix) {
  for (final subMatrix in lightsOutMatrix) {
    for (final cell in subMatrix) {
      if (!cell) return false;
    }
  }
  return true;
}

int countFilled(List<List<bool>> lightsOutMatrix) {
  var filled = 0;
  for (final subMatrix in lightsOutMatrix) {
    for (final cell in subMatrix) {
      if (cell) ++filled;
    }
  }
  return filled;
}
