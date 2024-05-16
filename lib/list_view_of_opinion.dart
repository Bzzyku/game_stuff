import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_stuff/button_to_generate_opinion_structure.dart';
import 'package:game_stuff/generate_diagnostic_opinion_structure.dart';
import 'package:game_stuff/generate_opinion_button.dart';

class ListViewOfOpinion extends StatelessWidget {
  const ListViewOfOpinion({super.key});

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
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 2),
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
               decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 0.5),
                            right: BorderSide(color: Colors.black, width: 0.5))
                        ),
              child: Row(
                children: OpinionsMaped,
              ), 
              )
                
            ],
          )

        ],
      ));
  }
}
