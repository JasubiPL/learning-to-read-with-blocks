import 'package:flutter/material.dart';

class MinecraftButton extends StatelessWidget {
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
      shadowColor: const Color(0xFF373737),
      highlightColor: const Color(0xFFFFFFFF),
      borderWidth: borderWidth,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: baseColor,
          border: Border(
            top: BorderSide(color: highlightColor, width: borderWidth),
            left: BorderSide(color: highlightColor, width: borderWidth),
            bottom: BorderSide(color: shadowColor, width: borderWidth),
            right: BorderSide(color: shadowColor, width: borderWidth),
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
