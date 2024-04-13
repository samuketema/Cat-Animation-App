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
 late Animation<double> boxAnimation;
 late AnimationController boxController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    boxController = AnimationController( 
      duration: Duration(seconds:1),
      vsync:this
    );

    boxAnimation = Tween(begin:0.5 , end: -11.0).animate(
      CurvedAnimation(parent: boxController, curve: Curves.linear)
    );
      boxController.forward();

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
          leftArm(),
          RightArm()
          
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
    top:3,
    left: 5,
    child:AnimatedBuilder(
    
    animation: boxAnimation,
    child: Container(
      height: 10,
      width: 125,
      color: Colors.red,
    ),

   builder: (context,child){
    return Transform.rotate(
    angle:boxAnimation.value,
    alignment: Alignment.topLeft,
    
    );
   }
   ),
   );
  
}
Widget RightArm(){
  return Positioned(
    top: 4,
    left: 65,
    child:  Transform.rotate(
    angle:pi*5.5/4 ,
    alignment: Alignment.topRight,
    child:  Container(
    height: 10,
    width: 125,
    color: Colors.red,
  )
  )
  );
}
}