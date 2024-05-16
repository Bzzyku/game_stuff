import 'dart:math';
import 'package:game_stuff/generate_keys.dart';
import 'package:game_stuff/procesor.dart';
import 'package:game_stuff/processor_to_generate_structure.dart';

List<Procesor> processors = [];
List<ProcessorToGenerateStructure> processorsToGenerateStructure = [];
List<Procesor>generateProcessors(int dimension ,void Function(int) function) {
  processors = [];
  processorsToGenerateStructure = [];
  if( dimension==0 ){
    generateKeys(dimension);
    processors.add(Procesor(left: 100, top: 100, name: 0, key: listOfGlobalKeys[dimension],));
    processorsToGenerateStructure.add(ProcessorToGenerateStructure(name: 0));
    return processors;
  }
  else{
  int numberOfProcessors = pow(2, dimension).toInt();
  int count = 0;
  double top = 0;
  generateKeys(numberOfProcessors);
  while (count < numberOfProcessors) {
    processors.add(Procesor(
        name: count ,
        key: listOfGlobalKeys[count],
        top: ((count % dimension == 0 && count != 0) ? top += 100 : top),
        left: (count % dimension) * 100 + 50));

    processorsToGenerateStructure.add(ProcessorToGenerateStructure(name: count));
    count++;
  }
 
    function(dimension); 
  return processors;
  }
  
}

void assignNeighboursOneByOne(int dimension) {
  int numberOfProcessors = pow(2,dimension).toInt();
  for (int i = 0; i < numberOfProcessors; i++) {
    for (var j = 1; j <= ((dimension / 2).floor() ); j++) {
      processors[i].neighboursToDrawLine.add(listOfGlobalKeys[(i + j) % numberOfProcessors]);
      processors[i].neighbours.add(listOfGlobalKeys[(i + j) % numberOfProcessors]);
      processors[(i + j) % numberOfProcessors].neighbours.add(listOfGlobalKeys[i]);

      processorsToGenerateStructure[i].neighbours.add(processorsToGenerateStructure[(i+j) % numberOfProcessors]);
      processorsToGenerateStructure[(i+j) % numberOfProcessors].neighbours.add(processorsToGenerateStructure[i]);

      if((!((dimension%2)==0))&&(processors[i].neighbours.length<3)){
        processors[i].neighboursToDrawLine.add(listOfGlobalKeys[i+2]);
        processors[i].neighbours.add(listOfGlobalKeys[i+2]);
        processors[i+2].neighbours.add(listOfGlobalKeys[i]);

        processorsToGenerateStructure[i].neighbours.add(processorsToGenerateStructure[i+2]);
        processorsToGenerateStructure[i+2].neighbours.add(processorsToGenerateStructure[i]);
      }
    }
  }
}

void assignNeighboursForNDimensionalHypercube(int dimension) {
  int numberOfProcessors = pow(2, dimension).toInt();
    int tmp = 0;
  for (int i = 0; i < numberOfProcessors; i++) {
      tmp++;
      if( tmp!=4){
      processors[i].neighboursToDrawLine.add(listOfGlobalKeys[(i + 1)%numberOfProcessors]);
      processors[i].neighbours.add(listOfGlobalKeys[(i+1)%numberOfProcessors]);
      processors[(i+1)%numberOfProcessors].neighbours.add(listOfGlobalKeys[i]);

      processorsToGenerateStructure[i].neighbours.add(processorsToGenerateStructure[(i+1)%numberOfProcessors]);
      processorsToGenerateStructure[(i+1)%numberOfProcessors].neighbours.add(processorsToGenerateStructure[i]);
      }if(tmp==4){
      tmp=0;
      processors[i].neighboursToDrawLine.add(listOfGlobalKeys[(i - 3)]);
      processors[i].neighbours.add(listOfGlobalKeys[(i-3)]);
      processors[(i-3)].neighbours.add(listOfGlobalKeys[i]);

      processorsToGenerateStructure[i].neighbours.add(processorsToGenerateStructure[(i-3)]);
      processorsToGenerateStructure[(i-3)].neighbours.add(processorsToGenerateStructure[i]);
      }
      if(i<numberOfProcessors/2){
      for(int k=3;k<=dimension; k++){
      processors[i].neighboursToDrawLine.add(listOfGlobalKeys[(i + pow(2, k-1).toInt())]);
      processors[i].neighbours.add(listOfGlobalKeys[(i + pow(2, k-1).toInt())]);
      processors[(i + pow(2, k-1).toInt())].neighbours.add(listOfGlobalKeys[i]);
      processorsToGenerateStructure[i].neighbours.add(processorsToGenerateStructure[(i + pow(2, k-1).toInt())]);
      processorsToGenerateStructure[(i + pow(2, k-1).toInt())].neighbours.add(processorsToGenerateStructure[i]);
      }
      }
  }


}


