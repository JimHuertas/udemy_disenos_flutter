import 'package:flutter/material.dart';

class HeaderCudrado extends StatelessWidget {
  const HeaderCudrado({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
      
    );
  }
}

class HeaderCircular extends StatelessWidget {
  const HeaderCircular({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvo2Painter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //propiedades
    paint.color = Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();

    //dibujar con el path y lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0,0);
    //path.lineTo(0, size.height * 0.5);



    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return true;
  }

}

class _HeaderTriangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //propiedades
    paint.color = Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();

    //dibujar con el path y lapiz
    path.moveTo(0, 0);
    path.lineTo(0,size.height * 0.25);
    path.lineTo(size.width/2, size.height * 0.33);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0,0);
    //path.lineTo(0, size.height * 0.5);



    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return true;
  }

}

class _HeaderCurvoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //propiedades
    paint.color = Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();

    //dibujar con el path y lapiz
    path.moveTo(0, 0);
    path.lineTo(0,size.height * 0.25);
    path.quadraticBezierTo(size.width/2, size.height*0.40, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    //path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return true;
  }

}

class _HeaderCurvo2Painter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //propiedades
    paint.color = Color(0xFF615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();

    //dibujar con el path y lapiz
    path.moveTo(0, 0);
    path.lineTo(0,size.height * 0.35);
    path.quadraticBezierTo(size.width/4, size.height*0.40, size.width/2, size.height * 0.35);
    path.quadraticBezierTo(size.width/4*3, size.height*0.30, size.width, size.height * 0.35);
    path.lineTo(size.width, 0);

    //path.lineTo(0, size.height * 0.5);
    
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return true;
  }

}