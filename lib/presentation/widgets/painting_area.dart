import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignaturePainter extends CustomPainter {
  List<Offset?> points = [];
  Color lineColor;

  SignaturePainter({
    required this.points,
    required this.lineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = lineColor // Use the selected line color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0; // Increased the stroke width for visibility

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant SignaturePainter oldDelegate) {
    return oldDelegate.points != points || oldDelegate.lineColor != lineColor;
  }
}



class PaintingArea extends StatefulWidget {
  const PaintingArea({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  PaintingAreaState createState() => PaintingAreaState();
}

class PaintingAreaState extends State<PaintingArea> {
  List<Offset?> points = [];
  Color selectedColor = Colors.black;


  Future<ui.Image> get rendered {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);
    SignaturePainter painter = SignaturePainter(points: points, lineColor: widget.color);
    var size = context.size!;
    painter.paint(canvas, size);
    return recorder.endRecording()
        .toImage(size.width.floor(), size.height.floor());
  }

  void clearSignature(){
    setState(() {
      points.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context,constraints) => GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                RenderBox renderBox = context.findRenderObject() as RenderBox;
                points.add(renderBox.globalToLocal(details.globalPosition));
              });
            },
            onPanEnd: (details) => points.add(null),
            child: CustomPaint(
              painter: SignaturePainter(points: points, lineColor: widget.color),
              size: Size(constraints.maxWidth, constraints.maxWidth),
            ),
          ),
        ),
      ],
    );
  }


}