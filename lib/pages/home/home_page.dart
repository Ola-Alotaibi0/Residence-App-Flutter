import 'package:flutter/material.dart';
import 'package:housing/constants_tools/constants.dart';
//import 'package:housing/pages/components/body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:housing/pages/home/components/body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //final _auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: buildAppBar(),
        body: Body(),
        //textDirection:TextDirection.rtl
    );
  }

  AppBar buildAppBar() {
    final _auth = FirebaseAuth.instance;

    return AppBar(
      backgroundColor: cPrimaryColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      //leading: IconButton(icon: Icon(Icons.menu), onPressed: (){},),

      actions: [
        //Container(),
        PopupMenuButton(
        // add icon, by default "3 dot" icon
        // icon: Icon(Icons.book)
        itemBuilder: (context){
      return [
        PopupMenuItem<int>(
          value: 0,
          child: Text("My Account"),
        ),

        PopupMenuItem<int>(
          value: 1,
          child: Text("Settings"),
        ),

        PopupMenuItem<int>(
          value: 2,
          child: Text("Logout"),
          onTap: (){
            _auth.signOut();
            Navigator.pop(context);
          },
        ),
      ];
    },
            onSelected:(value){
              if(value == 0){
                print("My account menu is selected.");
              }else if(value == 1){
                print("Settings menu is selected.");
              }else if(value == 2){
                print("Logout menu is selected.");
              }
            },

            //onCanceled: (){},
            //onSelected () {}
        ),

      ],

    );
  }
}
