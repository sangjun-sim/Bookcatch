import 'package:flutter/material.dart';

class BookcatchQuoteMark extends StatelessWidget {
  const BookcatchQuoteMark({
    super.key,
    required this.color,
    this.size = 36,
    this.semanticLabel,
  });

  final Color color;
  final double size;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final mark = SizedBox.square(
      dimension: size,
      child: CustomPaint(painter: _BookcatchQuoteMarkPainter(color)),
    );

    if (semanticLabel == null) {
      return ExcludeSemantics(child: mark);
    }

    return Semantics(label: semanticLabel, image: true, child: mark);
  }
}

class _BookcatchQuoteMarkPainter extends CustomPainter {
  const _BookcatchQuoteMarkPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.shortestSide / 24;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.save();
    canvas.scale(scale);
    canvas.drawPath(_materialSymbolsFormatQuotePath(), paint);
    canvas.restore();
  }

  Path _materialSymbolsFormatQuotePath() {
    return Path()
      ..moveTo(6, 17)
      ..lineTo(9, 17)
      ..lineTo(11, 13)
      ..lineTo(11, 7)
      ..lineTo(5, 7)
      ..lineTo(5, 13)
      ..lineTo(8, 13)
      ..close()
      ..moveTo(14, 17)
      ..lineTo(17, 17)
      ..lineTo(19, 13)
      ..lineTo(19, 7)
      ..lineTo(13, 7)
      ..lineTo(13, 13)
      ..lineTo(16, 13)
      ..close();
  }

  @override
  bool shouldRepaint(_BookcatchQuoteMarkPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
