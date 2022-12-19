/*
 * Created on Sun Dec 18 2022
 *
 * Copyright (c) 2022 anandasatriyo
 */

int uniquePathsWithObstacles(List<List<int>> OG) {
  int row = OG.length;
  int column = OG[0].length;
  var path = List.generate(
      row, (i) => List.generate(column, (j) => 0, growable: false));
  for (int a = 0; a < row; a++) {
    if (OG[a][0] == 0) {
      path[a][0] = 1;
    } else {
      path[a][0] = 0;
      break;
    }
  }
  for (int b = 0; b < column; b++) {
    if (OG[0][b] == 0) {
      path[0][b] = 1;
    } else {
      path[0][b] = 0;
      break;
    }
  }
  for (int i = 1; i < column; i++) {
    for (int j = 1; j < row; j++) {
      if (OG[j][i] == -1) {
        path[j][i] = 0;
      } else {
        path[j][i] = path[j - 1][i] + path[j][i - 1];
      }
    }
  }
  return path[row - 1][column - 1];
}
