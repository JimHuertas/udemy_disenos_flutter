import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
class IconHeader extends StatelessWidget {
  final IconData? icon;
  final String? titulo;
  final String? subtitulo;
  final Color color1;
  final Color color2;

  IconHeader({
    @required this.icon ,
    @required this.titulo,
    @required this.subtitulo,
    this.color1 = const Color(0xff526BF6),
    this.color2 = const Color(0xff67ACF2),
  });


  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(0.5);
    return Stack(
      children: <Widget>[ 
        _IconHeaderBackGround(
          color1: color1,
          color2: color2,
        ),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(icon , size: 250, color: Colors.white.withOpacity(0.2))
        ),

        Column(
          children: <Widget>[
            const SizedBox(height: 80, width: double.infinity),
            Text(subtitulo!, style: TextStyle(fontSize: 20, color: colorBlanco)),
            const SizedBox(height: 20),
            Text(titulo!, style: TextStyle(fontSize: 25, color: colorBlanco)),
            const SizedBox(height: 20),
            FaIcon(icon, size: 80, color: Colors.white,)

          ],
        )
      ]
    );
  }
}

class _IconHeaderBackGround extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBackGround({
    this.color1 = const Color(0xff526BF6),
    this.color2 = const Color(0xff67ACF2),
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width:  double.infinity,
      height: 300,
      decoration: BoxDecoration(
        //color: Colors.red,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            color1,
            color2,
          ]
        )
      ),
    );
  }
}