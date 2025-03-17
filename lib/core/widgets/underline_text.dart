import 'package:flutter/material.dart';

class UnderlineText extends StatefulWidget {
  final Text child;
  const UnderlineText({super.key, required this.child});

  @override
  State<UnderlineText> createState() => _UnderlineTextState();
}

class _UnderlineTextState extends State<UnderlineText> {
  late TextPainter textPainter;

  @override
  Widget build(BuildContext context) {
    paintText();
    return Stack(
      children: [
        Positioned(
          bottom: 0.5, // Adjust this value to change the space
          child: Container(
            width: textPainter.size.width,
            height: 1.2, // Adjust height for underline thickness
            color: Colors.black, // Underline color
          ),
        ),
        widget.child
      ],
    );
  }

  void paintText() {
    textPainter = TextPainter(
        text: TextSpan(text: widget.child.data, style: widget.child.style),
        maxLines: 1,
        textDirection: TextDirection.rtl);
    textPainter.layout();
  }
}
