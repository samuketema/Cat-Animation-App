import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/cat.dart';

class Home extends StatefulWidget{

  @override
  HomeState createState() => HomeState();

}

class HomeState extends State<Home> with TickerProviderStateMixin{
 late Animation<double> catAnimation;
 late AnimationController catController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    catController = AnimationController(
      duration: Duration(seconds:2),
      vsync: this);
    catAnimation = Tween(begin: 0.0 , end: 100.0).animate(
      CurvedAnimation(parent: catController, curve: Curves.easeIn),
      
      );
      catController.forward();
  }
  onTap() {
    if (catController.status == AnimationStatus.completed){
      catController.reverse();
    }
    else if (catController.status ==  AnimationStatus.dismissed){
        catController.forward();
    }
  }
Widget build(context){
  return Scaffold(
    appBar: AppBar(
      title: Text('Animation'),
      ),
    body:GestureDetector(
      child: Stack(
        children: [
          buildAnimation(),
          buildBox()
        ],
      ),
      onTap: onTap,

    ),
  );
}

Widget buildAnimation(){
  return AnimatedBuilder(
    animation: catAnimation, 
    builder: (context , child){
      return Container(
        child: child,
        margin: EdgeInsets.only(top: catAnimation.value),
      );
    },
    child: Cat()
    );
    
}
Widget buildBox() {
  return Container(
    height: 200.0,
    width: 200.0,
    color: Colors.brown,
  );
}

}