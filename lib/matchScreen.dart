import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';


class MatchScreen extends StatefulWidget {

  int type;

  MatchScreen(this.type);

  @override
  State<StatefulWidget> createState() => _MatchScreen();
}

class _MatchScreen extends State<MatchScreen> {

List<MatchModel> matchModel =[];

  void initState() {
    // TODO: implement initState
    super.initState();
    matchModel.add(MatchModel("HOME", "AWAY", true,"2 - 0"));
    if(widget.type==1){
      matchModel.add(MatchModel("US", "UK", false,"4 - 1"));
      matchModel.add(MatchModel("India", "Pakistan", false,"3 - 2"));
    }else{
      updateScore();
    }

  }
  updateScore(){
    Timer(Duration(seconds: 3), () {
      setState(() {
        matchModel[0].score="3 - 0";
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
                Container(padding:EdgeInsets.all(10),child: Text("HOME vs AWAY",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)),
                Expanded(
                  flex: 10,
                  child: ListView.builder(
                    itemCount: matchModel.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(2),
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              // matchModel[index].highlight =true;
                            });


                          },
                          child: Card(

                            color: matchModel[index].highlight
                                ? Colors.orangeAccent
                                : Colors.white,
                            child: Container(
                              padding: EdgeInsets.all(2),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                            height: 100,
                                            width: 100,
                                            padding: EdgeInsets.all(10),
                                            child: Image.network('https://img.freepik.com/premium-vector/football-logo-design_680400-15.jpg?w=2000')),
                                        Text(matchModel[index].TeamA,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                                      ],
                                    ),
                                    flex: 1,
                                  ),
                                  Expanded(
                                    child: Text(matchModel[index].score,textAlign:TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
                                    flex: 1,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                            height: 100,
                                            width: 100,
                                            padding: EdgeInsets.all(10),
                                            child: Image.network('https://i.pinimg.com/550x/fd/01/34/fd0134fd726dedc607f5f71aa25761ed.jpg')),
                                        Text(matchModel[index].TeamB,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                                      ],
                                    ),
                                    flex: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
  String TeamA,TeamB;
  bool highlight;
  String score;


  MatchModel(this.TeamA, this.TeamB, this.highlight,this.score);

}
