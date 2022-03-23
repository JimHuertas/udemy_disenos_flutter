import 'package:animate_do/animate_do.dart';
import 'package:app_disenos/src/widgets/bonton_gordo.dart';
import 'package:app_disenos/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final items = <ItemBoton>[
      ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
];

  List<Widget> itemMap = items.map(
    (item) => FadeInLeft(
      duration: Duration(milliseconds: 250),
      child: BotonGordo(
        titulo: item.texto, 
        color1: item.color1,
        color2: item.color2,
        onPressed: (){print('hola');},
        ),
    )
  ).toList();

    return Scaffold(
      body:  Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                SizedBox(height: 60,),
                  ...itemMap
              ],
            ),
          ),
          _Encabezado()
        ],
      )
    );
  }
}

class _Encabezado extends StatelessWidget {
  const _Encabezado({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: 'Asistencia Medica',
          subtitulo: 'Haz solicitado'
        ),
        Positioned(
          right: 10,
          top: 40,
          child: RawMaterialButton(
            onPressed: (){},
            shape: CircleBorder(),
            padding: EdgeInsets.all(15.0),
            child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white,),
          ),
        )
      ],
      
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      onPressed: (){print('funcion aqui');},
      titulo: 'Motor Accident',
      // color1: Colors.amber,
      // color2: Colors.red,
      icon: FontAwesomeIcons.accessibleIcon,
    );
  }
}

class PageHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      titulo: 'Asistencia Medica',
      subtitulo: 'Haz solicitado',
      // color1: Colors.grey,
      // color2: Colors.red,
    );
  }
}