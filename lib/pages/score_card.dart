import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return(Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Scorecard')),
        ),
        body: Column(children: [
          const Center(child: Text("Cubing competition")),
            Padding(
              padding: const EdgeInsets.fromLTRB(25,0,25,0),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 40, width: 230,
                    decoration: BoxDecoration(
                    border: Border.all(color:Colors.black, width: 1.0)),
                    ),
                ),
                  Container(height: 40, width: 40, 
                    decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1)),),
              ],),
            ),
          const Padding(
            padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
            child: Row(children: [
              Text("ID"),
              SizedBox(width: 45,),
              Text("Name")
            ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Container(width: 50, height: 40, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Container(width: 220, height: 40, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),),
              )
            ],),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(17,5,25,5),
            child: Row(children: [

              const Text("1"),
              const SizedBox(width: 10,),
              Container(width: 180, height: 50, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),),
              const SizedBox(width: 10,),
              Container(width: 40, height: 50, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),),
              const SizedBox(width: 10,),
              Container(width: 40, height: 50, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(17,5,25,5),
            child: Row(children: [

              const Text("2"),
              const SizedBox(width: 10,),
              Container(width: 180, height: 50, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),),
              const SizedBox(width: 10,),
              Container(width: 40, height: 50, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),),
              const SizedBox(width: 10,),
              Container(width: 40, height: 50, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(17,5,25,5),
            child: Row(children: [

              const Text("3"),
              const SizedBox(width: 10,),
              Container(width: 180, height: 50, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),),
              const SizedBox(width: 10,),
              Container(width: 40, height: 50, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),),
              const SizedBox(width: 10,),
              Container(width: 40, height: 50, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(17,5,25,5),
            child: Row(children: [

              const Text("4"),
              const SizedBox(width: 10,),
              Container(width: 180, height: 50, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),),
              const SizedBox(width: 10,),
              Container(width: 40, height: 50, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),),
              const SizedBox(width: 10,),
              Container(width: 40, height: 50, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 5,25,5),
            child: Row(children: [

              const Text("5"),
              const SizedBox(width: 10,),
              Container(width: 180, height: 50, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),),
              const SizedBox(width: 10,),
              Container(width: 40, height: 50, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),),
              const SizedBox(width: 10,),
              Container(width: 40, height: 50, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),),

            ]),
          ),
          const Center(child: Text("Average of 5 is 14")),
          const SizedBox(width: 200, height: 100, child: Center(child: Text("Start Inspection", style: TextStyle(fontSize: 25),)),)
        ],),
      )
    );
  }
}