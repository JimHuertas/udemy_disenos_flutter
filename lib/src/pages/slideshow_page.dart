import 'package:app_disenos/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(child: MySlideshow()),
            Expanded(child: MySlideshow()),
          ],
          )
      )
    );
  }
}

class MySlideshow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 20,
      bulletSecundario: 10,
      dotsArriba: false,
      colorPrimario: Colors.pink,
      colorSecundario: Colors.grey,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/1.svg'),
        SvgPicture.asset('assets/svgs/2.svg'),
        SvgPicture.asset('assets/svgs/3.svg'),
        SvgPicture.asset('assets/svgs/4.svg'),
        SvgPicture.asset('assets/svgs/5.svg'),
      ]
    );
  }
}