import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({ Key? key }) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin{

  AnimationController? controller;

  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;


  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    controller!.addListener(() {
      print('Value: ${controller!.value}');
      setState(() {
            porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller!.value)!;
      });
    });
    
    super.initState();
  }
  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: () {
          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje +=  10 ;
          if(nuevoPorcentaje > 100){
            nuevoPorcentaje = 0;
          }

          controller!.forward(from: 0.0);
          setState(() {});
        },

      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 200,
          height: 200,
          //color: Colors.blue,
          child: CustomPaint(
            painter: _MiRadialProgress(porcentaje)
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter{

  final porcentaje;
  _MiRadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;
    
    final center = Offset(size.width/2, size.height/2);
    final radio = min(size.width/2, size.height/2);
    
    canvas.drawCircle(center, radio, paint);

    //arco
    final paintArco = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
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