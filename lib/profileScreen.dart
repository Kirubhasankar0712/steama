import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {



  void initState() {
    // TODO: implement initState
    super.initState();
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
            backgroundColor: Colors.red,
            title: const Text('Profile',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700)),
            iconTheme: const IconThemeData(color: Colors.white),

            brightness: Brightness.light,
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child:Column(
              children: [
                Container(padding:EdgeInsets.all(10),child: Text("Cristiano Ronaldo",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red),)),
                Expanded(
                  flex: 10,
                  child:Column(
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(8), // Border radius
                          child: ClipOval(child: Image.network('https://c4.wallpaperflare.com/wallpaper/139/444/1000/soccer-cristiano-ronaldo-wallpaper-preview.jpg')),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Card(
                          color: Colors.red,
                          child: Container(
                            height: 200,
                            width: 400,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Text("Yellow Cards :  3",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                              Text("Red Cards    :  2",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ),
              ],

            ),
          ),
        ),
        );
  }




}
