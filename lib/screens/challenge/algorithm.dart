import 'package:prueba_3_astronautas/models/models.dart';

class Algorithm {
  void setRowBoard() {}
  bool isSafe(List<List<Island>> M, int row, int col, List<List<bool>> visited,
      int rowBoard, int colBoard) {
    return (row >= 0) &&
        (row < rowBoard) &&
        (col >= 0) &&
        (col < colBoard) &&
        (M[row][col].number == 1 && !visited[row][col]);
  }

  void dfs(List<List<Island>> m, int row, int col, List<List<bool>> visited,
      int rowBoard, int colBoard) {
    List<int> rowNbr = [0, -1, 0, 0, 0, 0, 1, 0];
    List<int> colNbr = [-1, 0, 1, -1, 1, -1, 0, 1];

    visited[row][col] = true;

    for (int k = 0; k < 8; ++k)
      if (isSafe(
          m, row + rowNbr[k], col + colNbr[k], visited, rowBoard, colBoard))
        dfs(m, row + rowNbr[k], col + colNbr[k], visited, rowBoard, colBoard);
  }

  int countIslands(List<List<Island>> m, int rowBoard, int colBoard) {
    List<List<bool>> visited = List<List<bool>>();

    for (int i = 0; i < rowBoard; i++) {
      List<bool> list = [];
      for (int j = 0; j < colBoard; j++) {
        list.add(false);
      }
      visited.add(list);
    }
    int count = 0;
    for (int i = 0; i < rowBoard; ++i)
      for (int j = 0; j < colBoard; ++j)
        if (m[i][j].number == 1 && !visited[i][j]) {
          dfs(m, i, j, visited, rowBoard, colBoard);
          ++count;
        }
    return count;
  }
}
