import 'package:flutter/material.dart';
import 'package:game_stuff/button_to_generate_opinion_structure.dart';
import 'package:game_stuff/generate_diagnostic_opinion_structure.dart';
import 'package:game_stuff/generate_opinion.dart';
import 'package:game_stuff/generate_processors.dart';
List<List<String>> opinions = [];
List<Container> OpinionsMaped = [];
class GenerateOpinionButton extends StatefulWidget {
  const GenerateOpinionButton({super.key});

  @override
  State<GenerateOpinionButton> createState() => _GenerateOpinionButtonState();
}

class _GenerateOpinionButtonState extends State<GenerateOpinionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ()
      {
        resetValues();
          generateComparativeSample(processorsToGenerateStructure.length, comparativeSample);
          comparativeSampleMaped = mapComparativeSample(comparativeSample);
        
        opinions = generateOpinion();
        OpinionsMaped = mapVektorOfOpinions(opinions);
    
      }, 
      child: const Text('Generuj opinie diagnostyczną'));
  }
}
void resetValues(){
    comparativeSample = [];
    opinions = [];
}