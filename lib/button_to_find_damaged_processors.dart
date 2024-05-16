import 'package:flutter/material.dart';
import 'package:game_stuff/generate_diagnostic_opinion_structure.dart';
import 'package:game_stuff/generate_opinion_button.dart';
import 'package:game_stuff/generate_processors.dart';
import 'package:game_stuff/procesor.dart';
import 'package:game_stuff/processor_to_generate_structure.dart';
List<List<int>> reliabilityStatusOfMatchedOpinions = [];
class ButtonToFindDamagedProcessors extends StatefulWidget {
  const ButtonToFindDamagedProcessors({super.key});

  @override
  State<ButtonToFindDamagedProcessors> createState() => _ButtonToFindDamagedProcessorsState();
}

class _ButtonToFindDamagedProcessorsState extends State<ButtonToFindDamagedProcessors> {
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: () {
        findDamagedProcessors();
        showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Uszkodzone procesory'),
        content: findDamagedProcessors(),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
      },
      child: Text('Znajdz uszkodzone procesory'));
  }
}
Widget findDamagedProcessors() {
  List<String> tempOpinions = opinions.expand((list) => list).toList();
  reliabilityStatusOfMatchedOpinions=[];
  for (var i = 0; i < vektorOfOpinions.length; i++) {
    bool allMatched = true;

    for (var j = 0; j < vektorOfOpinions[i].length; j++) {
      if (vektorOfOpinions[i][j] != 'X') {
        if (vektorOfOpinions[i][j] != tempOpinions[j]) {
          allMatched = false;
          break; 
        }
      }
    }

    if (allMatched) {
      reliabilityStatusOfMatchedOpinions.add(reliabilityStatus[i]);
    }
  }
  if(printDamagedProcessors().length==1){
  return Text(printDamagedProcessors()[0]);
  }
  else{
    return Text("Nie udało się jednoznacznie zdiagnozować które procesory są uszkodzone\n Możliwe uszkodzone procesory to:\n ${printDamagedProcessors()}");
  }
}

  List<String> printDamagedProcessors(){
    List<String> temp = [];
    List<String> temp2=[];
    List<List<String>> temp3 = [];
    if(reliabilityStatusOfMatchedOpinions.isNotEmpty){
  for(var i=0;i<reliabilityStatusOfMatchedOpinions.length;i++){
    for(var j=0;j<reliabilityStatusOfMatchedOpinions[i].length;j++){
      if(reliabilityStatusOfMatchedOpinions[i][j]==1){
         temp.add(j.toString());   
      }
    }
    if(temp!=[]){
      temp3.add(temp);
      temp = [];
      }
  }
  for(int k=0;k<temp3.length;k++){
    temp2.add(temp3[k].toString()); 
  }
  return temp2;
  }
  else{
    temp2.add(' Nie zostałalub nie można  wygenerowanać opinii diagnostycznej i struktury opiniowania diagnostycznego przez brak lini transmiji w strukturze');
    return temp2;
  }
}


