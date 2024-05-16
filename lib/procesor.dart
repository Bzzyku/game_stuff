import 'dart:math';
import 'package:flutter/material.dart';
import 'package:game_stuff/generate_keys.dart';
import 'package:game_stuff/generate_processors.dart';
import 'package:game_stuff/main.dart';



class Procesor extends StatefulWidget {
    Procesor({
    required this.left,
    required this.top,
    required this.name,
    super.key
    });
    final int name;
    double left;
    double top;
    final List<GlobalKey<ProcesorState>> neighbours = [];
    final List<GlobalKey<ProcesorState>> neighboursToDrawLine = [];
    bool damaged = false;
  
  
  @override
  State<Procesor> createState() => ProcesorState();

}


class ProcesorState extends State<Procesor> {
  late double top = widget.top;
  late double left = widget.left;
  bool damaged = false;
  


  @override
  void initState() {
    super.initState();
    top = widget.top;
    left = widget.left;
    damaged = widget.damaged;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTap: () {
          setState(() {
            
            widget.damaged = !widget.damaged; 
            damaged = !damaged;       
          });
        },
        onPanUpdate: (details) {
          setState(() {
            _updatePosition(details);
            
          });
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: damaged ? Colors.red : Colors.blue,
            ),
            child: Center(
              child: Text(
                '${widget.name}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ),
    );
  }





  void _updatePosition(DragUpdateDetails details) {
     top = max(0, top + details.delta.dy);
     left = max(0, left + details.delta.dx);
     widget.top = top;
     widget.left = left;
  }



  int task({int a = 3,int b =2}){
    return damaged ? rng.nextInt(5)+6 : a+b ;  
  }

  List<String> delegateTask(){
      List<String> vektor = [];
     for(var i=0; i < widget.neighbours.length-1;i++){
      for(var j=0;j<widget.neighbours.length-i-1;j++){
        if(damaged){
          
          vektor.add(rng.nextInt(2).toString());
        }
        else{
        if(widget.neighbours[i].currentState?.task() != widget.neighbours[i+j+1].currentState?.task()){
          vektor.add('1');
        }
        else{
          vektor.add('0');
        }
        }
      }
    }
    return vektor;
  }

}

