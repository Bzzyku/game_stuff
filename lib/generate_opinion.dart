import 'package:game_stuff/generate_keys.dart';


List<List<String>> generateOpinion(){
  List<List<String>>  vektor=[];
  for (var procesorKey in listOfGlobalKeys){
    
    vektor.add(procesorKey.currentState!.delegateTask());
  }
  return vektor;
}

