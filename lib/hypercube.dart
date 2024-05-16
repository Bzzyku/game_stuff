import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_stuff/button_to_find_damaged_processors.dart';
import 'package:game_stuff/button_to_generate_opinion_structure.dart';
import 'package:game_stuff/generate_keys.dart';
import 'package:game_stuff/generate_opinion_button.dart';
import 'package:game_stuff/generate_processors.dart';
import 'package:game_stuff/procesor.dart';
import 'package:game_stuff/transmision_line_between_processors.dart';

class Hypercube extends StatefulWidget {
  const Hypercube({super.key});

  @override
  State<Hypercube> createState() => _HypercubeState();
}

class _HypercubeState extends State<Hypercube> {

  bool isBuilt = false;

  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isBuilt = true;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         if (isBuilt)
          for (GlobalKey<ProcesorState> processorKey in listOfGlobalKeys) 
            for (GlobalKey<ProcesorState> neighbour
              in processorKey.currentState!.widget.neighboursToDrawLine) ...[
              TransmisionLineBetweenProcessors(
                procesorKey: processorKey,
                neighbourKey: neighbour, 
              )
            ],
        for (Procesor processor in processors) ...[
          processor,
        ],
       
         const Positioned(
          left: 700,
          top: 200,
           child: Column(
            children: [
               GenerateOpinionButton(),
               ButtonToGenerateOpinionStructure(),
               ButtonToFindDamagedProcessors(),
            ],
                   ),
         ),
      ],
    );
  }
}
