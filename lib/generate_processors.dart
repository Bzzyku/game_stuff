import 'package:game_stuff/generate_keys.dart';
import 'package:game_stuff/procesor.dart';
import 'package:game_stuff/processor_to_generate_structure.dart';

List<Procesor> processors = [];
List<ProcessorToGenerateStructure> processorsToGenerateStructure = [];
List<Procesor>generateProcessors(int numberOfProcessors, int numberOfNeighbours) {
  int count = 0;
  double top = 0;
  generateKeys(numberOfProcessors, listOfGlobalKeys);
  while (count < numberOfProcessors) {
    processors.add(Procesor(
        name: count ,
        key: listOfGlobalKeys[count],
        top: ((count % numberOfNeighbours == 0 && count != 0) ? top += 100 : top),
        left: (count % numberOfNeighbours) * 100 + 50));

    processorsToGenerateStructure.add(ProcessorToGenerateStructure(name: count));
    count++;
  }
  assignNeighbours(numberOfProcessors, numberOfNeighbours);
  return processors;
}

void assignNeighbours(int numberOfProcessors, numberOfNeighbours) {
  for (var i = 0; i < numberOfProcessors; i++) {
    for (var j = 1; j <= ((numberOfNeighbours / 2).floor() ); j++) {
      processors[i].neighboursToDrawLine.add(listOfGlobalKeys[(i + j) % numberOfProcessors]);
      processors[i].neighbours.add(listOfGlobalKeys[(i + j) % numberOfProcessors]);
      processors[(i + j) % numberOfProcessors].neighbours.add(listOfGlobalKeys[i]);

      processorsToGenerateStructure[i].neighbours.add(processorsToGenerateStructure[(i+j) % numberOfProcessors]);
      processorsToGenerateStructure[(i+j) % numberOfProcessors].neighbours.add(processorsToGenerateStructure[i]);

      if((!((numberOfNeighbours%2)==0))&&(processors[i].neighbours.length<3)){
        processors[i].neighboursToDrawLine.add(listOfGlobalKeys[i+2]);
        processors[i].neighbours.add(listOfGlobalKeys[i+2]);
        processors[i+2].neighbours.add(listOfGlobalKeys[i]);

        processorsToGenerateStructure[i].neighbours.add(processorsToGenerateStructure[i+2]);
        processorsToGenerateStructure[i+2].neighbours.add(processorsToGenerateStructure[i]);
      }
    }
  }
}


