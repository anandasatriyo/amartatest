/*
 * Created on Sun Dec 18 2022
 *
 * Copyright (c) 2022 anandasatriyo
 */

import 'dart:math';

late List<List<int>> g;
int maxAreaOfIsland(List<List<int>> grid) {
  g = grid;
  int islands = 0;
  for (int i = 0; i < g.length; i++) {
    for (int j = 0; j < g[i].length; j++) {
      if (g[i][j] == 0) {
      } else {
        islands = max(islands, sink(i, j));
      }
    }
  }
  return islands;
}

int sink(int i, int j) {
  if (i < 0 || i == g.length || j < 0 || j == g[i].length || g[i][j] == 0) {
    return 0;
  } else {
    g[i][j] = 0;
    return 1 +
        sink(i + 1, j) +
        sink(i - 1, j) +
        sink(i, j - 1) +
        sink(i, j + 1);
  }
}
