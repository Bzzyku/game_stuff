import 'package:flutter/material.dart';
import 'package:game_stuff/button_to_generate_opinion_structure.dart';
import 'package:game_stuff/generate_diagnostic_opinion_structure.dart';


class ListViewOfDiagnosticOpinionStructure extends StatelessWidget {
  const ListViewOfDiagnosticOpinionStructure({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      trackVisibility: true,
      scrollbarOrientation: ScrollbarOrientation.bottom,

      child: ListView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        children: [SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width+ 24*comparativeSample.length,
          child: ListView(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 65) ,
                    child: Container(
                      margin: const EdgeInsets.only(left: 1),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(color: Colors.black, width: 1.0),
                          bottom: BorderSide(color: Colors.black,width: 1.0))
                      ),
                      child: Column(
                        children: reliabilityStatusMaped,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 0.5),
                            right: BorderSide(color: Colors.black, width: 0.5))
                        ),
                        child: Row(
                          children: comparativeSampleMaped,
                        ),
                      ),
                       Container(
                        margin: const EdgeInsets.only(left: 1),
                        decoration: const BoxDecoration(
                          border: Border(left: BorderSide(color: Colors.black,width: 0.5),
                          top: BorderSide(color: Colors.black, width: 0.5))
                        ),
                         child: Column(
                          children: vektorOfOpinionsMaped,
                         ),
                       ),
                    ],
                   
                  )
                ],
              )
            ],
          ),
        ),
        ]
      ),
    );
  }
}
