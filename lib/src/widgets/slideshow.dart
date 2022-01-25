import 'package:flutter/material.dart';

import 'package:provider/provider.dart';



// ignore: use_key_in_widget_constructors
class Slideshow extends StatelessWidget {  

  final List<Widget>? slides;
  final bool dotsArriba;
  final int bulletPrimario;
  final int bulletSecundario;
  final Color? colorPrimario;
  final Color? colorSecundario;

  Slideshow({
    @required this.slides,
    this.dotsArriba = false,
    this.colorPrimario,
    this.colorSecundario,
    this.bulletPrimario = 12,
    this.bulletSecundario = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>_SlideshowModel(),
      child: SafeArea(
        child: Center(
            child: Builder(
              builder: (BuildContext context){
                Provider.of<_SlideshowModel>(context).colorPrimario = colorPrimario!;
                Provider.of<_SlideshowModel>(context).colorSecundario = colorSecundario!;
                Provider.of<_SlideshowModel>(context).bulletPrimario = bulletPrimario.toDouble();
                Provider.of<_SlideshowModel>(context).bulletSecundario = bulletSecundario.toDouble();

                return _CrearEstructuraSlideshow(
                  dotsArriba: dotsArriba, 
                  slides: slides
                );
              } 
            )
          ),
      ),
    );
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    Key? key,
    required this.dotsArriba,
    required this.slides,
  }) : super(key: key);

  final bool dotsArriba;
  final List<Widget>? slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[ 
        if(dotsArriba) _Dots(slides!.length),
        Expanded(
          child: _Slides(slides) 
        ),
        if(!dotsArriba) _Dots(slides!.length),
      ]
    );
  }
}

class _Dots extends StatelessWidget {

  final int lenghtSlides;

  _Dots(
    this.lenghtSlides,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:List.generate(lenghtSlides, (index) => _Dot(index)).toList() ,
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final index;
  _Dot(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlideshowModel>(context); 

    final tamano;
    Color color;

    if(slideshowModel.currentPage >= index - 0.5 && slideshowModel.currentPage < index + 0.5) {
      tamano = slideshowModel.bulletPrimario;
      color = slideshowModel.colorPrimario;
    } else{
      tamano = slideshowModel.bulletSecundario;
      color = slideshowModel.colorSecundario;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      )

    );
  }
}


class _Slides extends StatefulWidget {
  final List<Widget>? slides;

  _Slides(
    this.slides
  );

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();


  @override
  void initState() {
    
    super.initState();

    pageViewController.addListener(() { 
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides!.map<_Slide>((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}


class _SlideshowModel with ChangeNotifier{
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => _currentPage;
  set currentPage(double? currentPage){
    _currentPage = currentPage!;
    notifyListeners();  
  }

  Color get colorPrimario => _colorPrimario;
  set colorPrimario(Color? colorP){
    _colorPrimario = colorP!;
    //notifyListeners();
  }

  Color get colorSecundario => _colorSecundario;
  set colorSecundario(Color? colorS){
    _colorSecundario = colorS!;
    //notifyListeners();
  }


  double get bulletSecundario => _bulletSecundario;
  set bulletSecundario(double? bulletS){
    _bulletSecundario = bulletS!;
  //  notifyListeners();
  }

  double get bulletPrimario => _bulletPrimario;
  set bulletPrimario(double? bulletP){
    _bulletPrimario = bulletP!;
  //  notifyListeners();
  }
}