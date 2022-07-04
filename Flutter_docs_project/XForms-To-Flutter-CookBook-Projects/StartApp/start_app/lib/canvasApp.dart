import 'package:flutter/material.dart';

class Signature extends StatefulWidget {
  const Signature({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignatureState();
}

class SignatureState extends State<Signature> {
  List<Offset?> _points = <Offset?>[];

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      final RenderBox referenceBox = context.findRenderObject() as RenderBox;
      final Offset localPosition =
          referenceBox.globalToLocal(details.globalPosition);
      _points = List.from(_points)..add(localPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) => _onPanUpdate,
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child: CustomPaint(
        painter: SignaturePainter(_points),
        size: Size.infinite,
      ),
    );
  }
}

class SignaturePainter extends CustomPainter {
  const SignaturePainter(this.points);
  final List<Offset?> points;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 115.0;

    for (var i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainter oldDelegate) =>
      oldDelegate.points != points;
}
