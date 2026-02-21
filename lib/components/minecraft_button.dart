import 'package:flutter/material.dart';

class MinecraftButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color baseColor;
  final Color shadowColor;
  final Color highlightColor;
  final double borderWidth;
  final double? width;
  final double? height;

  const MinecraftButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.baseColor = const Color(0xFF8B8B8B), // Default stone color
    this.shadowColor = const Color(0xFF373737),
    this.highlightColor = const Color(0xFFFFFFFF),
    this.borderWidth = 4.0,
    this.width,
    this.height,
  });

  // Factory constructor for diamond buttons
  factory MinecraftButton.diamond({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
    double borderWidth = 4.0,
    double? width,
    double? height,
  }) {
    return MinecraftButton(
      key: key,
      onPressed: onPressed,
      baseColor: const Color(0xFF56C9C4), // Diamond base
      shadowColor: const Color(0xFF337976), // Diamond shadow
      highlightColor: const Color(0xFFA5F0ED), // Diamond highlight
      borderWidth: borderWidth,
      width: width,
      height: height,
      child: child,
    );
  }

  // Factory constructor for stone buttons (inventory grid)
  factory MinecraftButton.stone({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
    double borderWidth = 4.0,
  }) {
    return MinecraftButton(
      key: key,
      onPressed: onPressed,
      baseColor: const Color(0xFF8B8B8B),
      // Invert shadow and highlight to create an inset (sunken) effect
      shadowColor: const Color(0xFFFFFFFF), // Bottom right is light for inset
      highlightColor: const Color(0xFF373737), // Top left is dark for inset
      borderWidth: borderWidth,
      child: child,
    );
  }

  // Factory constructor for wood buttons (back/navigation)
  factory MinecraftButton.wood({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
    double borderWidth = 4.0,
    double? width,
    double? height,
  }) {
    return MinecraftButton(
      key: key,
      onPressed: onPressed,
      baseColor: const Color(0xFFBC8E52), // Oak plank base
      shadowColor: const Color(0xFF7A5A2F), // Dark wood shadow
      highlightColor: const Color(0xFFDEB774), // Light wood highlight
      borderWidth: borderWidth,
      width: width,
      height: height,
      child: child,
    );
  }

  @override
  State<MinecraftButton> createState() => _MinecraftButtonState();
}

class _MinecraftButtonState extends State<MinecraftButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    // When pressed, swap highlight/shadow for an inset look
    final topLeftColor = _isPressed
        ? widget.shadowColor
        : widget.highlightColor;
    final bottomRightColor = _isPressed
        ? widget.highlightColor
        : widget.shadowColor;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _isPressed ? 0.95 : 1.0,
          _isPressed ? 0.95 : 1.0,
          1.0,
        ),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.baseColor,
          border: Border(
            top: BorderSide(color: topLeftColor, width: widget.borderWidth),
            left: BorderSide(color: topLeftColor, width: widget.borderWidth),
            bottom: BorderSide(
              color: bottomRightColor,
              width: widget.borderWidth,
            ),
            right: BorderSide(
              color: bottomRightColor,
              width: widget.borderWidth,
            ),
          ),
        ),
        child: Center(child: widget.child),
      ),
    );
  }
}
