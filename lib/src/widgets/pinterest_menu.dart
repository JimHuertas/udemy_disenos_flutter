import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function()? onPressed;
  final IconData icon;

  PinterestButton({
    @required this.icon = Icons.account_tree_sharp,
    @required this.onPressed,
  });
  
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;

  final Color backgroundColor;
  final Color primaryColor;
  final Color secundaryColor;
  final List<PinterestButton>? items;

  PinterestMenu({
    this.mostrar = true,
    this.backgroundColor = Colors.white,
    this.primaryColor = Colors.black,
    this.secundaryColor = Colors.blueGrey,
    @required this.items
  });

  // final List<PinterestButton> items = [
  //   PinterestButton(icon: Icons.pie_chart, onPressed: (){print('Icon Pie Shard');}),
  //   PinterestButton(icon: Icons.search, onPressed: (){print('Icon Search');}),
  //   PinterestButton(icon: Icons.notification_add, onPressed: (){print('Icon Nitification');}),
  //   PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){print('Icon Supervised User Circle');}),
  // ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: (mostrar) ? 1 : 0,
        child: Builder(
          builder: (context) {
            Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
            Provider.of<_MenuModel>(context).primaryColor = primaryColor;
            Provider.of<_MenuModel>(context).secondaryColor = secundaryColor;
            return _PinterestMenuBackground( 
              child: _MenuItems(items!)
            );
          }
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget? child;
  _PinterestMenuBackground({
    @required this.child
  });

  @override
  Widget build(BuildContext context) {
    Color background = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          ),
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems(@required this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate( menuItems.length , (i) => _PinterestMenuButton(i, menuItems[i])),
      
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  
  final int index;
  final PinterestButton? item;

  _PinterestMenuButton(
    this.index,
    this.item,
  );

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    Color primaryColor = Provider.of<_MenuModel>(context).primaryColor;
    Color secundaryColor = Provider.of<_MenuModel>(context).secondaryColor;
    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context,listen: false).itemSeleccionado = index;
        item!.onPressed!();
      },
      //behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item!.icon,
          color: (itemSeleccionado == index) ? primaryColor :  secundaryColor ,
          size: (itemSeleccionado == index) ? 35 : 25
        )
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;

  Color _backgroundColor = Colors.white;
  Color _primaryColor = Colors.blueGrey;
  Color _secondaryColor = Colors.black38;

  int get itemSeleccionado => _itemSeleccionado;
  set itemSeleccionado(int index){
    _itemSeleccionado = index;
    notifyListeners();
  }

  Color get backgroundColor => _backgroundColor;
  set backgroundColor (Color index){
    _backgroundColor = index;
   // notifyListeners();
  }

  Color get primaryColor => _primaryColor;
  set primaryColor(Color index){
    _primaryColor = index;
    //notifyListeners();
  }

  Color get secondaryColor => _secondaryColor;
  set secondaryColor(Color index){
    _secondaryColor = index;
    //notifyListeners();
  }
  
}