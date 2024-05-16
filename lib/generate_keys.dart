import 'package:flutter/material.dart';
import 'package:game_stuff/procesor.dart';

List<GlobalKey<ProcesorState>> listOfGlobalKeys=[];
List<GlobalKey<ProcesorState>> listOfGlobalKeysToGenerateStructure=[];
void generateKeys(int numberOfKeys, List<GlobalKey<ProcesorState>> listOfGlobalKeys){
  for(var i=0;i<numberOfKeys;i++){
  listOfGlobalKeys.add(GlobalKey<ProcesorState>());
  }
}

