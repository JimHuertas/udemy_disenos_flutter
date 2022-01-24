import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final porcentaje;
  final Color colorPrimario;
  final Color colorFondo;
  final grosorFondo;
  final grosorPrimario;

  RadialProgress({
    @required this.porcentaje,
    this.colorPrimario = Colors.blue,
    this.colorFondo = Colors.grey,
    this.grosorFondo = 4.0,
    this.grosorPrimario = 10.0
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{

  AnimationController? controller;
  double? porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller!.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller!,
      builder: (BuildContext context, Widget? child){
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(10.0),
          child: CustomPaint(
            painter: _MiRadialProgress(
              (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller!.value),
              widget.colorPrimario,
              widget.colorFondo,
              widget.grosorFondo,
              widget.grosorPrimario
            )
          ),
        );
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter{

  final porcentaje;
  final Color colorPrimario;
  final Color colorFondo;
  final grosorFondo;
  final grosorPrimario;
  _MiRadialProgress(
    this.porcentaje, 
    this.colorPrimario,
    this.colorFondo,
    this.grosorFondo,
    this.grosorPrimario
  );

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..strokeWidth = grosorFondo
      ..color = colorFondo
      ..style = PaintingStyle.stroke;

    
    final center = Offset(size.width/2, size.height/2);
    final radio = min(size.width/2, size.height/2);
    
    canvas.drawCircle(center, radio, paint);

    //arco
    final paintArco = Paint()
      ..strokeWidth = grosorPrimario
      ..strokeCap = StrokeCap.round
      ..color = colorPrimario
      ..style = PaintingStyle.stroke;
    
    double arcoAngle = 2 * pi * ( porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi / 2,
      arcoAngle,
      false,
      paintArco);
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}