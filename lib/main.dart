import 'package:flutter/material.dart';
import 'package:game_stuff/generate_processors.dart';
import 'package:game_stuff/hypercube.dart';
import 'dart:math';

import 'package:game_stuff/list_view_of_diagnostic_opinion_structure.dart';
import 'package:game_stuff/list_view_of_opinion.dart';
var rng = Random();

void main() {
  generateProcessors(0, assignNeighboursForNDimensionalHypercube);
  runApp(
        MaterialApp( 
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(child: Text('Struktura'),),
                Tab(child: Text('Struktura opiniowania diagnostycznego ')),
                Tab(child: Text('Opinia diagnostyczna'))
              ],
            ) ,),
          body:  const TabBarView(children: [
            Hypercube(),
            ListViewOfDiagnosticOpinionStructure(),
            ListViewOfOpinion()
            ]),
        ),
      ),

    )


  );
}





