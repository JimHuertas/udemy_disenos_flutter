import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final Color color1;
  final Color color2;
  final Function()? onPressed;
  
  const BotonGordo({
    this.icon = FontAwesomeIcons.carCrash,
    this.color1 = const Color(0xff6989F5),
    this.color2 = const Color(0xff906EF5),
    @required this.titulo = 'Sin Titulo',
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Stack(
        children: <Widget>[
          _BotonGordoBackground(
            color1: color1,
            color2: color2,
            icon: icon,
          ),
          Row(
            children: <Widget>[
              SizedBox(height: 140, width: 40,),
              FaIcon(icon, color: Colors.white, size:40),
              SizedBox(width: 20),
              Expanded(child: Text(titulo, style: TextStyle(color: Colors.white, fontSize: 18))),
              FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              SizedBox(width: 40,),
              
            ]
          )
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  final IconData icon;

  _BotonGordoBackground({
    this.color1 = const Color(0xff6989F5),
    this.color2 = const Color(0xff6989F5),
    this.icon = FontAwesomeIcons.circle
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(icon, size: 150, color: Colors.white.withOpacity(0.2))
            )
          ]
        ),
      ),
      width: double.infinity,
      height: 100,
      //color: Colors.red,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black.withOpacity(0.2), offset: Offset(4, 6), blurRadius: 10),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color>[
            color1,
            color2,
          ] 
        )
      ),
      //child: Text('Boton Gordo')
    );
  }
}

