import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignaturePainter extends CustomPainter {
  late List<(Offset?, Color lineColor)> points = [(null, lineColor)];
  Color lineColor;

  SignaturePainter({
    required this.points,
    required this.lineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i].$1 != null && points[i + 1].$1 != null) {
        Paint paint = Paint()
          ..color = points[i].$2
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 5.0;
        canvas.drawLine(points[i].$1!, points[i + 1].$1!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant SignaturePainter oldDelegate) {
    return oldDelegate.points != points || oldDelegate.lineColor != lineColor;
  }
}

class PaintingArea extends StatefulWidget {
  const PaintingArea({Key? key, required this.color})
      : super(key: key);
  final Color color;

  @override
  PaintingAreaState createState() => PaintingAreaState();
}

class PaintingAreaState extends State<PaintingArea> {
  late List<(Offset?, Color lineColor)> points = [(null, widget.color)];
  List<int> pointsCountPerPanEnd = [];


  Future<ui.Image> get rendered {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);
    SignaturePainter painter =
        SignaturePainter(points: points, lineColor: widget.color);
    var size = context.size!;
    painter.paint(canvas, size);
    return recorder
        .endRecording()
        .toImage(size.width.floor(), size.height.floor());
  }

  void clearSignature() {
    setState(() {
      points.clear();
    });
  }

  void back(){
    if(points.isEmpty || pointsCountPerPanEnd.isEmpty) return;
    setState(() {
      points = points.sublist(0,points.length - pointsCountPerPanEnd.last);
      pointsCountPerPanEnd = pointsCountPerPanEnd.sublist(0,pointsCountPerPanEnd.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) => GestureDetector(
            onPanStart: (_){
              pointsCountPerPanEnd.add(1);
            },
            onPanUpdate: (details) {
              setState(() {
                RenderBox renderBox = context.findRenderObject() as RenderBox;
                pointsCountPerPanEnd[pointsCountPerPanEnd.length - 1]++;
                points.add((renderBox.globalToLocal(details.globalPosition), widget.color));
              });
            },
            onPanEnd: (details) {
              points.add((null, Colors.transparent));
            },
            child: CustomPaint(
              painter:
                  SignaturePainter(points: points, lineColor: widget.color),
              size: Size(constraints.maxWidth, constraints.maxWidth),
            ),
          ),
        ),
      ],
    );
  }
}
