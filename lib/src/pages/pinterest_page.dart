import 'package:app_disenos/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';


// ignore: use_key_in_widget_constructors
class PinterestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold( 
        body: Stack(
          children: <Widget>[
            PinterestGrid(),
            _PinterestMenuLocation()
          ]
        ),
        //body: PinterestMenu()
       ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    final widthPantalla = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 30,
      child: Container(
        width: widthPantalla,
        //color: Colors.red,
        child: Align(
          alignment: Alignment.center,
          child: PinterestMenu(
            mostrar: mostrar,
            //backgroundColor: Colors.green,
            //primaryColor: Colors.red,
            //secundaryColor: Colors.amber,
            items: [
              PinterestButton(icon: Icons.pie_chart, onPressed: (){print('Icon Pie Shard');}),
              PinterestButton(icon: Icons.search, onPressed: (){print('Icon Search');}),
              PinterestButton(icon: Icons.notification_add, onPressed: (){print('Icon Nitification');}),
              PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){print('Icon Supervised User Circle');}),
            ],
          )
        ),
      )
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double scrollAnterior = 0;
  @override
  void initState() {
    controller.addListener(() {
      if(controller.offset > scrollAnterior){
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
        print('Se oculta');
      }else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
        print('Se muestra');
      }
      if(controller.offset >= 0) {
        scrollAnterior = controller.offset;
      }
      //print(controller.offset.toString());
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      controller: controller,
      padding: EdgeInsets.symmetric(horizontal: 4),
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        pattern: [
          WovenGridTile(1),
          WovenGridTile(
            5 / 7,
            crossAxisRatio: 0.9,
            alignment: AlignmentDirectional.centerEnd,
          ),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => _PinterestItem(index: index),
          childCount: items.length),
    );
  }
}
 
class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem({
    Key? key,
    required this.index,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}


class _MenuModel extends ChangeNotifier{
  bool _mostrar = true;

  bool get mostrar => _mostrar;
  set mostrar(bool otro){
    _mostrar = otro;
    notifyListeners();  
  }
}