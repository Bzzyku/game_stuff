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
  int dimension=4;
  bool isBuilt = false;
  String? selectedValue;
  String ? selectedFunction;
  final List<String> values = ['0', '1', '2','3','4','5','6'];
  final List<String> functions = ['hiperszescian','losowo'];

  void generateStructure() {
    
    setState(() {
    dimension = int.parse(selectedValue!);
    isBuilt = false;
    if(selectedFunction=='hiperszescian'){
       generateProcessors(dimension, assignNeighboursForNDimensionalHypercube);
    }
    else{
      generateProcessors(dimension, assignNeighboursOneByOne);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isBuilt = true;
      });
    });
    
    });
  }

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
       
          Positioned(
          left: 700,
          top: 200,
           child: Column(
            children: [
               GenerateOpinionButton(),
               ButtonToGenerateOpinionStructure(),
               ButtonToFindDamagedProcessors(),
               DropdownButton<String>(
                hint: Text('Wybierz wartość'),
                value: selectedValue,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue = newValue;
                  });
                },
                items: values.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              DropdownButton<String>(
                hint: Text('Wybierz funkcję'),
                value: selectedFunction,
                onChanged: (newValue) {
                  setState(() {
                    selectedFunction = newValue;
                  });
                },
                items: functions.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),
              ElevatedButton(

                onPressed: (selectedValue == null || selectedFunction == null) ? null : generateStructure,
                child: const Text('Generuj strukturę'),
              )
            ],
                   ),
         ),
      ],
    );
  }
}
