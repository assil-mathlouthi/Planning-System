import 'package:get/get.dart';

class TableController extends GetxController {
  final instanceList = <Map<String, dynamic>>[].obs;
  final currentPage = 0.obs;
  final RxInt hoveredRowIndex = (-1).obs; // -1 means no hover
  final rowsPerPage = 10;

  List<Map<String, dynamic>> get currentRows {
    final start = currentPage.value * rowsPerPage;
    final end = (start + rowsPerPage).clamp(0, instanceList.length);
    return instanceList.sublist(start, end);
  }

  int get totalPages => (instanceList.length / rowsPerPage).ceil();

  void nextPage() {
    if (currentPage.value < totalPages - 1) currentPage.value++;
  }

  void previousPage() {
    if (currentPage.value > 0) currentPage.value--;
  }

  void setData(List<Map<String, dynamic>> data) {
    instanceList.assignAll(data);
    currentPage.value = 0;
  }

  void setHoveredRow(int index) {
    hoveredRowIndex.value = index;
  }

  bool isRowHovered(int index) => hoveredRowIndex.value == index;
}
