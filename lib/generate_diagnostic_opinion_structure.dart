import 'package:game_stuff/generate_processors.dart';
import 'package:calc/calc.dart';

List<List<int>> comparativeSample = [];
List<List<int>> reliabilityStatus = [];
List<List<String>> vektorOfOpinions = [];

void generateDiagnosticOpinionStructure(
    int nDiagnosability,
    int numberOfProcessors,
    List<List<int>> comparativeSample,
    List<List<String>> vektorOfOpinions,
    List<List<int>> reliabilityStatus) {
  generateComparativeSample(numberOfProcessors, comparativeSample);
  List<int> indexes = makeIndexes(numberOfProcessors);
  List<int> reliabilityStatusTemp = List<int>.filled(numberOfProcessors, 0);
  for (int i = 1; i <= nDiagnosability; i++) {
    List<List<int>> listOfCombinationsIndexes =
        generateCombinations(indexes, i);
    for (List<int> combIndex in listOfCombinationsIndexes) {
      for (int comb in combIndex) {
        reliabilityStatusTemp[comb] = 1;
        processorsToGenerateStructure[comb].damaged = true;
      }
      vektorOfOpinions.add(generateDiagnose(numberOfProcessors));
      reliabilityStatus.add(List.of(reliabilityStatusTemp));
      for (int comb in combIndex) {
        reliabilityStatusTemp[comb] = 0;
        processorsToGenerateStructure[comb].damaged = false;
      }
    }
  }
}

List<String> generateDiagnose(int numberOfProcessors) {
  List<String> vektor = [];

  for (var i = 0; i < numberOfProcessors; i++) {
    for (var x = 0;
        x < processorsToGenerateStructure[i].neighbours.length;
        x++) {
      for (int y = 1 + x;
          y < processorsToGenerateStructure[i].neighbours.length;
          y++) {
        if (processorsToGenerateStructure[i].damaged) {
          vektor.add('X');
        } else {
          if ((!processorsToGenerateStructure[i].neighbours[x].damaged) &&
              (!processorsToGenerateStructure[i].neighbours[y].damaged)) {
            vektor.add('0');
          } else if (processorsToGenerateStructure[i].neighbours[x].damaged !=
              processorsToGenerateStructure[i].neighbours[y].damaged) {
            vektor.add('1');
          } else {
            vektor.add('X');
          }
        }
      }
    }
  }
  return vektor;
}

void generateComparativeSample(
    numberOfProcessors, List<List<int>> comparativeSample) {
  for (var i = 0; i < numberOfProcessors; i++) {
    for (var x = 0;
        x < processorsToGenerateStructure[i].neighbours.length;
        x++) {
      for (int y = 1 + x;
          y < processorsToGenerateStructure[i].neighbours.length;
          y++) {
        comparativeSample.add([
          processorsToGenerateStructure[i].name,
          processorsToGenerateStructure[i].neighbours[x].name,
          processorsToGenerateStructure[i].neighbours[y].name
        ]);
      }
    }
  }
}

int uniquePairsCount(int size, int units) {
  return (factorial(size) ~/ (factorial(units) * factorial(size - units)));
}

List<int> makeIndexes(int numberOfProcessors) {
  List<int> reliabilityStatusTemp =
      List<int>.generate(numberOfProcessors, (index) => index);
  return reliabilityStatusTemp;
}

List<List<int>> generateCombinations(List<int> items, int k) {
  if (k == 0) {
    return [[]];
  }
  if (items.isEmpty) {
    return [];
  }

  List<List<int>> combinations = [];
  int first = items.first;
  List<int> rest = items.sublist(1);

  List<List<int>> subCombinations = generateCombinations(rest, k - 1);
  for (List<int> subCombination in subCombinations) {
    combinations.add([first, ...subCombination]);
  }
  combinations.addAll(generateCombinations(rest, k));

  return combinations;
}
