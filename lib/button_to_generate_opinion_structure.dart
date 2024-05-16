import 'package:flutter/material.dart';
import 'package:game_stuff/generate_diagnostic_opinion_structure.dart';
import 'package:game_stuff/generate_keys.dart';
import 'package:game_stuff/generate_processors.dart';
import 'package:game_stuff/procesor.dart';

List<Widget> vektorOfOpinionsMaped = [];
List<Widget> comparativeSampleMaped = [];
List<Widget> reliabilityStatusMaped = [];
int numberOfDamagedProcessors = 0;

class ButtonToGenerateOpinionStructure extends StatefulWidget {
  const ButtonToGenerateOpinionStructure({super.key});

  @override
  State<ButtonToGenerateOpinionStructure> createState() => _ButtonToGenerateOpinionStructureState();
}

class _ButtonToGenerateOpinionStructureState extends State<ButtonToGenerateOpinionStructure> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed
      , 
      child: const Text('Generuj strukture opiniowania diagnostycznego'));
  }

  void onPressed(){
     resetValues();
     countNumberOfDamagedProcessors();
     generateDiagnosticOpinionStructure(numberOfDamagedProcessors, processorsToGenerateStructure.length);
     vektorOfOpinionsMaped = mapVektorOfOpinions(vektorOfOpinions);
     comparativeSampleMaped =  mapComparativeSample(comparativeSample);
     reliabilityStatusMaped = mapReliabilityStatus(reliabilityStatus);


  }
}

void resetValues(){
    comparativeSample = [];
    reliabilityStatus = [];
    vektorOfOpinions = [];
}

List<Container> mapVektorOfOpinions(List<List<String>> vektorOfOpinions){
  return vektorOfOpinions.map((opinion) => Container(
    alignment: Alignment.centerLeft,
    height: 22,
                    child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: opinion.map((item) => Container(
                                      width: 24,
                                      decoration: const BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.black, width: 1.0),
                                        right: BorderSide(color: Colors.black,width: 1.0),)
                                      ),
                                      child: Center(child: Text(item,softWrap: true,)))).toList(),
                    ),
                  )).toList();
                  
}

List<Container> mapReliabilityStatus (List<List<int>> reliabilityStatus){
  return reliabilityStatus.map((row) => Container(
    height: 22,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black, width: 1.0),
              right: BorderSide(color: Colors.black, width: 0.5)
              )
          ),
          child: Row(
            
            children: row.map((item) => Text('$item',
            softWrap: true,)).toList(),
          ),
        )).toList();
}


List<Container> mapComparativeSample(List<List<int>> comparativeSample){
  return comparativeSample.map((row) => Container(
          height: 65.5,
          width: 24,
          decoration: const BoxDecoration(border: Border(
            left: BorderSide(color: Colors.black, width: 1.0),
            top: BorderSide(color: Colors.black, width: 1.0)
          )),
          child: Column(
            children: row.map((e) => Center(child: Text('$e',style: const TextStyle(fontFamily: 'Monospace'),))).toList()),
        )).toList();
}


void countNumberOfDamagedProcessors(){
  numberOfDamagedProcessors = 0;
  for (GlobalKey<ProcesorState> k in listOfGlobalKeys){
      if(k.currentState!.damaged==true){
          numberOfDamagedProcessors ++;
      }
  }
}