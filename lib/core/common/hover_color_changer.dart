

    import 'package:flutter/material.dart';

    class HoverColorChanger extends StatefulWidget {
      final Widget child;
      final Color defaultColor;
      final Color hoverColor;

      const HoverColorChanger({
        super.key,
        required this.child,
        required this.defaultColor,
        required this.hoverColor,
      });

      @override
      // ignore: library_private_types_in_public_api
      _HoverColorChangerState createState() => _HoverColorChangerState();
    }

    class _HoverColorChangerState extends State<HoverColorChanger> {
      bool _isHovered = false;

      @override
      Widget build(BuildContext context) {
        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200), // Optional: for smooth transition
            color: _isHovered ? widget.hoverColor : widget.defaultColor,
            child: widget.child,
          ),
        );
      }
    }