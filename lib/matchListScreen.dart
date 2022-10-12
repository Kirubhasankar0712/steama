import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';


class MatchListScreen extends StatefulWidget {





  @override
  State<StatefulWidget> createState() => _MatchListScreen();
}

class _MatchListScreen extends State<MatchListScreen> {

List<MatchModel> matchModel =[];

  void initState() {
    // TODO: implement initState
    super.initState();
    matchModel.add(MatchModel("Russia", "https://media.bleacherreport.com/f_auto,w_340,h_234,q_auto,c_fill/br-img-slides/003/375/304/Manchester-United_crop_north.png", "1"));
    matchModel.add(MatchModel("USA", "https://media.bleacherreport.com/f_auto,w_340,h_234,q_auto,c_fill/br-img-slides/003/375/304/Manchester-United_crop_north.png", "2"));
    matchModel.add(MatchModel("Italy", "https://media.bleacherreport.com/f_auto,w_340,h_234,q_auto,c_fill/br-img-slides/003/375/304/Manchester-United_crop_north.png", "3"));
    matchModel.add(MatchModel("Nepal", "https://media.bleacherreport.com/f_auto,w_340,h_234,q_auto,c_fill/br-img-slides/003/375/304/Manchester-United_crop_north.png", "4"));
    matchModel.add(MatchModel("India", "https://media.bleacherreport.com/f_auto,w_340,h_234,q_auto,c_fill/br-img-slides/003/375/304/Manchester-United_crop_north.png", "5"));
    matchModel.add(MatchModel("Australia", "https://media.bleacherreport.com/f_auto,w_340,h_234,q_auto,c_fill/br-img-slides/003/375/304/Manchester-United_crop_north.png", "6"));
    matchModel.add(MatchModel("Srilanka", "https://media.bleacherreport.com/f_auto,w_340,h_234,q_auto,c_fill/br-img-slides/003/375/304/Manchester-United_crop_north.png", "7"));
    matchModel.add(MatchModel("Africa", "https://media.bleacherreport.com/f_auto,w_340,h_234,q_auto,c_fill/br-img-slides/003/375/304/Manchester-United_crop_north.png", "8"));
    matchModel.add(MatchModel("Germany", "https://media.bleacherreport.com/f_auto,w_340,h_234,q_auto,c_fill/br-img-slides/003/375/304/Manchester-United_crop_north.png", "9"));
    matchModel.add(MatchModel("UK", "https://media.bleacherreport.com/f_auto,w_340,h_234,q_auto,c_fill/br-img-slides/003/375/304/Manchester-United_crop_north.png", "10"));



    reorderRank();
  }
reorderRank(){
  Timer(Duration(seconds: 3), () {
    setState(() {
      int newIndex =  2;
      int oldIndex =  5;
      matchModel.insert(newIndex, matchModel[oldIndex]);
      if (oldIndex < newIndex) {
        matchModel.removeAt(oldIndex);
      } else {
        matchModel.removeAt(oldIndex + 1);
      }
    });

  });


}


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:  Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {

              },
            ),
            title: const Text('Match List',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700)),
            iconTheme: const IconThemeData(color: Colors.white),

            brightness: Brightness.light,
          ),
          body: Container(
            color: Color(0xff737475),
            child:Column(
              children: [

               Expanded(
                  flex: 10,
                  child: ReorderableListView(
                    padding: EdgeInsets.all(6),
                    buildDefaultDragHandles: false,
                    onReorder: (int oldIndex, int newIndex) {
                      matchModel.insert(newIndex, matchModel[oldIndex]);
                      if (oldIndex < newIndex) {
                        matchModel.removeAt(oldIndex);
                      } else {
                        matchModel.removeAt(oldIndex + 1);
                      }
                      setState(() {});
                    },
                    children: matchModel.asMap().entries.map((e) {
                      return ReorderableDragStartListener(
                        index: e.key,
                        key: Key(e.key.toString() + e.value.teamName),
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(e.value.rank,textAlign:TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                                  flex: 1,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 75,
                                          width: 75,
                                          padding: EdgeInsets.all(10),
                                          child: Image.network(e.value.logo)),
                                      Text(e.value.teamName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                                    ],
                                  ),
                                  flex: 9,
                                ),


                              ],
                            ),
                          ),
                          elevation: 4,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],

            ),
          ),
        ),
        );
  }




}
class MatchModel{
  String teamName,logo,rank;

  MatchModel(this.teamName, this.logo, this.rank);
}
