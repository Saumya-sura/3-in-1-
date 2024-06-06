import 'package:flutter/material.dart';
import 'dart:math' as math ;

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash>  with SingleTickerProviderStateMixin{
  late AnimationController animController;
  late Animation<double> animation;
  void initState(){
    super.initState();
    animController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    animation = Tween<double>( 
      begin: 0,
      end: 2 * math.pi,
    ).animate(animController)..addListener((){
      setState(() {
        
      });
    })..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        animController.reverse();
      }
      else if(status == AnimationStatus.dismissed){
        animController.forward();
      }
    });
    
    animController.forward();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    animController.dispose();
    super.dispose();
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Transform.rotate(angle: animation.value, child: Container( 
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: Image.asset('assets/splash.png'),
        ),
      ),
      
      ),
    );
  }
}