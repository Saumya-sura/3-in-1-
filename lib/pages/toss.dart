import'package:flutter/material.dart';
import 'dart:math';

import 'package:manyinone/pages/app_drawer.dart';

class Coin extends StatefulWidget {
  const Coin({super.key});

  @override
  State<Coin> createState() => _CoinState();
}

class _CoinState extends State<Coin>  with SingleTickerProviderStateMixin{
  late AnimationController _animation;
  late Animation<double> _Animate;
  bool  isHead = true;
  bool _isAnimating = false;
  @override
  void initState(){
    super.initState();
    _animation = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    _Animate = Tween(begin: 0.0,end: pi).animate(_animation)..addListener((){
      setState(() {
        
      });
    })..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        setState(() {
          isHead = Random().nextBool();
          _isAnimating = false;
        });
        _animation.reset();
      }
    });
  }
  void dispose(){
    _animation.dispose();
    super.dispose();
  }
  void _StartAnimation(){ 
    if(!_isAnimating){
      setState(() {
        _isAnimating = true;
      });
      _animation.forward();
    }
  }
  Widget buildCoin(){
    return Transform(transform: Matrix4.rotationY(_Animate.value), 
    alignment: Alignment.center,
      child: Image.asset( 
        isHead ? 'assets/head.png' : 'assets/tail.png',
        width: 200,
        height: 200,
      ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar:AppBar( 
        title: Text( "Toss")
      ),
      drawer: AppDrawer(),
    body: GestureDetector( 
      onTap: _StartAnimation,
      child:  Container(  
        color: Colors.blue,
        child: Center( 
          child: _isAnimating ? buildCoin() : Text( isHead ? 'heads' : 'Tails', 
         
          ),
        ),
      ),
    ),
    );
  }
}