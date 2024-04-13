import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/cat.dart';
import 'dart:math';
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
      duration: Duration(milliseconds:10),
      vsync: this);
    catAnimation = Tween(begin: 136.0 , end: 193.5).animate(
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

      child: Center(
        child: Stack(
        clipBehavior: Clip.none,
        children: [
          buildAnimation(),
          buildBox(),
          leftArm()
          
        ],
      ),
      ),
       
      onTap: onTap,

    ),
  );
}

Widget buildAnimation(){
  return AnimatedBuilder(
    animation: catAnimation, 
    builder: (context , child){
      return Positioned(
        
        bottom: catAnimation.value,
        right: 0.0,
        left: 0.0,
        child: child!,
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

Widget leftArm(){
  return Positioned(
    top: 3,
    left: 5,
    child: Transform.rotate(
    angle:-1.39*pi,
    alignment: Alignment.topLeft,
    child: Container(
      height: 10,
      width: 125,
      color: Colors.red,
    ),
    )
  );
}
}