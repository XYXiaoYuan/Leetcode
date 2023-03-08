import 'dart:math';
import 'Dependencies/Tools/Random.dart';

/**
 https://leetcode.cn/problems/rotting-oranges/
 
 在给定的 m x n 网格 grid 中，每个单元格可以有以下三个值之一：

 值 0 代表空单元格；
 值 1 代表新鲜橘子；
 值 2 代表腐烂的橘子。
 每分钟，腐烂的橘子 周围 4 个方向上相邻 的新鲜橘子都会腐烂。

 返回 直到单元格中没有新鲜橘子为止所必须经过的最小分钟数。如果不可能，返回 -1 。

  

 示例 1：



 输入：grid = [[2,1,1],[1,1,0],[0,1,1]]
 输出：4
 示例 2：

 输入：grid = [[2,1,1],[0,1,1],[1,0,1]]
 输出：-1
 解释：左下角的橘子（第 2 行， 第 0 列）永远不会腐烂，因为腐烂只会发生在 4 个正向上。
 示例 3：

 输入：grid = [[0,2]]
 输出：0
 解释：因为 0 分钟时已经没有新鲜橘子了，所以答案就是 0 。
  

 提示：

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 10
 grid[i][j] 仅为 0、1 或 2


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/rotting-oranges
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

main(List<String> args) {
  final s = _994_rotting_oranges();

  print(s);
  final result1 = s.orangesRotting([
    [2, 1, 1],
    [1, 1, 0],
    [0, 1, 1],
  ]);
  // assert(result1 == 4);
  print(result1);

  final result2 = s.orangesRotting([
    [2, 1, 1],
    [0, 1, 1],
    [1, 0, 1],
  ]);
  // assert(result2 == -1);
  print(result2);

  final result3 = s.orangesRotting([
    [0, 2],
  ]);
  // assert(result3 == 0);
  print(result3);

  // s.test();
}

class Direction {
  Direction(
    this.x,
    this.y,
  );
  late int x;
  late int y;

  @override
  String toString() {
    return "[x = $x, y = $y]";
  }
}

class _994_rotting_oranges {
  static List<Direction> directions = [
    Direction(0, 1),
    Direction(1, 0),
    Direction(0, -1),
    Direction(-1, 0),
  ];

  int orangesRotting(List<List<int>> grid) {
    print("grid = $grid");
    final row = grid.length;
    final col = grid[0].length;

    var rotten = <Direction>[];

    /// 腐烂集合
    var fresh = <Direction>[];

    /// 新鲜集合
    for (var i = 0; i < row; i++) {
      for (var j = 0; j < col; j++) {
        if (grid[i][j] == 2) {
          rotten.add(Direction(i, j));
        }
        if (grid[i][j] == 1) {
          fresh.add(Direction(i, j));
        }
      }
    }

    print("入参 fresh = $fresh, rotten = $rotten ");

    var time = 0;

    while (!fresh.isEmpty) {
      if (rotten.isEmpty) {
        return -1;
      }
      var tempRotten = <Direction>[];
      for (var rd in rotten) {
        for (var dd in directions) {
          /// 即将腐烂的如果在新鲜的集合中，就将它腐烂
          final temp = Direction(rd.x + dd.x, rd.y + dd.y);
          print("temp = $temp");
          if (fresh.contains(temp)) {
            tempRotten.add(temp);
            print("要从fresh里移除的烂橘子 $temp");
            fresh.remove(temp);
          }
        }
      }
      rotten = tempRotten;

      print("while循环里 fresh = $fresh, rotten = $rotten ");

      time += 1;
    }
    return time;
  }
}

extension Test on _994_rotting_oranges {
  test() {
    final testTime = 1000;
    print("对数器开始工作, 执行 【$testTime】 次");
    var isSucceed = true;
    final count = 10;
    for (var i = 0; i < testTime; i++) {
      final m = Int.random(1, count);
      final n = Int.random(1, count);

      var nums = <List<int>>[];
      for (var i = 0; i < m; i++) {
        var temp = <int>[];
        for (var j = 0; j < n; j++) {
          final t = Int.random(0, 2);
          temp.add(t);
        }
        nums.add(temp);
      }

      /// 方法一
      final result1 = orangesRotting(nums);

      final result2 = orangesRotting(nums);

      if (result1 != result2) {
        isSucceed = false;
        print("第 ${i + 1} 次测试失败, num = $nums");
        break;
      } else {
        print("第 i + 1 次测试成功, ($m * $n), num = $nums, result = $result1");
      }
    }
    print("${isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣"}");
  }

  int next(int min, int max) {
    final res = min + Random().nextInt(max - min + 1);
    return res;
  }
}
