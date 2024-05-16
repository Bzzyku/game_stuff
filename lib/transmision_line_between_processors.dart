import 'package:flutter/material.dart';
import 'package:game_stuff/procesor.dart';

class TransmisionLineBetweenProcessors extends StatefulWidget {
    final GlobalKey<ProcesorState> procesorKey;
    final GlobalKey<ProcesorState> neighbourKey;

   const TransmisionLineBetweenProcessors({required this.procesorKey, required this.neighbourKey, super.key});

  @override
  State<TransmisionLineBetweenProcessors> createState() => _TransmisionLineBetweenProcessorsState();
}

class _TransmisionLineBetweenProcessorsState extends State<TransmisionLineBetweenProcessors> {


  @override
  Widget build(BuildContext context) {
    
      return Positioned(
        top: 32,
        left: 32,
        child: CustomPaint(
          painter: LinePainter(
            procesorKey: widget.procesorKey,
            neighbourKey: widget.neighbourKey,
           ),
        ),
      );
  }
}

class LinePainter extends CustomPainter {
     GlobalKey<ProcesorState> procesorKey;
     GlobalKey<ProcesorState> neighbourKey;


  LinePainter({ required this.procesorKey, required this.neighbourKey});

  @override
  void paint(Canvas canvas, Size size) {
    // print('Painting line from ${procesorKey.currentState!.top}${procesorKey.currentState!.left} to ${neighbourKey.currentState!.top}${neighbourKey.currentState!.left}');
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;
    canvas.drawLine(Offset(procesorKey.currentState!.left, procesorKey.currentState!.top), Offset(neighbourKey.currentState!.left, neighbourKey.currentState!.top), paint);
  }

@override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}