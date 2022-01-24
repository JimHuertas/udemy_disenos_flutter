import 'package:app_disenos/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({ Key? key }) : super(key: key);

  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if(porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
        child: Icon(Icons.refresh)
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue,),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.green,)
            ],     
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.pink,),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.red,)
            ],     
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.amberAccent,),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.cyan,)
            ],     
          ),
        ]
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;

  const CustomRadialProgress({
    @required this.porcentaje = 0.0,
    @required this.color = Colors.blue

  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      //color:  Colors.red,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorFondo: Colors.grey,
        grosorFondo: 4.0,
        grosorPrimario: 10.0,
      ),
    );
  }
}