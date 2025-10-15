import 'package:flutter/material.dart';
import 'package:planning_system/features/voeux/controller/table_controller.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({
    super.key,
    required this.currentPage,
    required this.tableController,
    required this.totalPages,
  });

  final int currentPage;
  final TableController tableController;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: currentPage > 0
              ? tableController.previousPage
              : null,
        ),
        Text('Page ${currentPage + 1} of $totalPages'),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: currentPage < totalPages - 1
              ? tableController.nextPage
              : null,
        ),
      ],
    );
  }
}
