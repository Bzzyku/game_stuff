import 'package:game_stuff/main.dart';

class ProcessorToGenerateStructure{

ProcessorToGenerateStructure({required this.name});

bool damaged = false;
int name;
List<ProcessorToGenerateStructure> neighbours = [];

int task({int a = 3,int b =2}){
    
    return damaged ? rng.nextInt(5)+6 : a+b ;  
  }

  List<int> delegateTask(){
      List<int> vektor = [];
     for(var i=0; i < neighbours.length-1;i++){
      for(var j=0;j<neighbours.length-i-1;j++){
        if(damaged){
          vektor.add(rng.nextInt(2));
        }
        else{
        if(neighbours[i].task() != neighbours[i+j+1].task()){
          vektor.add(1);
        }
        else{
          vektor.add(0);
        }
        }
      }
    }
    return vektor;
  }
}