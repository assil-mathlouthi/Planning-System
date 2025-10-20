import 'package:flutter_test/flutter_test.dart';
import 'package:planning_system/core/controller/table_controller.dart';

void main() {
  group('TableController pagination', () {
    test('computes total pages and current rows correctly', () {
      final c = TableController();
      final data = List.generate(13, (i) => {'col': i});

      c.setData(data);
      expect(c.totalPages, 3); // 13 items, 5 per page -> 3 pages
      expect(c.currentPage.value, 0);
      expect(c.currentRows.length, 5);
      expect(c.currentRows.first['col'], 0);

      c.nextPage();
      expect(c.currentPage.value, 1);
      expect(c.currentRows.length, 5);
      expect(c.currentRows.first['col'], 5);

      c.nextPage();
      expect(c.currentPage.value, 2);
      expect(c.currentRows.length, 3);
      expect(c.currentRows.first['col'], 10);

      // cannot go past last page
      c.nextPage();
      expect(c.currentPage.value, 2);

      // go back
      c.previousPage();
      expect(c.currentPage.value, 1);
    });
  });
}
