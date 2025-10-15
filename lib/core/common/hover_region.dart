import 'package:flutter/material.dart';

/// HoverRegionRow wraps a widget and changes background color when hovered
class HoverRegionRow extends StatefulWidget {
  final Widget child;
  final Color hoverColor;
  final Color defaultColor;

  const HoverRegionRow({
    super.key,
    required this.child,
    required this.hoverColor,
    required this.defaultColor,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HoverRegionRowState createState() => _HoverRegionRowState();
}

class _HoverRegionRowState extends State<HoverRegionRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Container(
        color: _hovered ? widget.hoverColor : widget.defaultColor,
        child: widget.child,
      ),
    );
  }
}
