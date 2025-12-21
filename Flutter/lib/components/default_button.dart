import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isFull;
  final double width;
  final double height;
  final double textSize;
  final String variant;

  const DefaultButton({ super.key, required this.text, required this.onPressed, this.isFull = false, this.width = 90, this.height = 90, this.textSize = 40, this.variant = 'wood'});
  
  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  bool _isPressed = false;
  Map<String, Map<String, Color>> variantColor = {
    'wood': {
      'primary': Color.fromARGB(255, 242, 164, 88),
      'secondary': Color.fromARGB(255, 65, 42, 31),
    },
    'diamond': {
      'primary': Color.fromARGB(255, 125, 203, 190),
      'secondary': Color.fromARGB(255, 80, 139, 127)
    }
  };



  @override
  Widget build(BuildContext context) {
    final Color primaryColor = variantColor[widget.variant]?['primary'] ?? Colors.grey;
    final Color secondaryColor = variantColor[widget.variant]?['secondary'] ?? Colors.black;

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
        width: widget.isFull ? double.infinity : widget.width,
        height: widget.height + 8,
        decoration: BoxDecoration(
          color: primaryColor,
          border: Border.all(color: secondaryColor, width: 4)
        ),
        child: Column(
          children: [
            Container(
              height: 4,
              color: Color.fromARGB(150, 255, 255, 255),
            ),
            SizedBox(
              height: widget.height - 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Color.fromARGB(150, 255, 255, 255),
                    width: 4,
                  ),
                  Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: widget.isFull ? GoogleFonts.pressStart2p(
                      color: secondaryColor,
                      fontSize: 24,
                    )
                    : GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: widget.textSize,
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(150, 0, 0, 0),
                    width: 4,
                  ),
                ],
              ),
            ),
            Container(
              height: 4,
              color: Color.fromARGB(150, 0, 0, 0),
            ),
          ],
        ),
      ),
    );
  }
}