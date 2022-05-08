import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:housing/constants_tools/constants.dart';
import 'package:housing/pages/home/components/card_list_plan.dart';
import 'package:housing/pages/home/components/categories.dart';
import 'package:housing/pages/home/components/listview_featured_houses_card.dart';
import 'package:housing/pages/home/components/title_with_more_btn.dart';
import 'package:housing/pages/details/details_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:housing/pages/home/components/card_list_plan.dart';

import 'header_with_searchbox.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _auth = FirebaseAuth.instance;
  late User signedInUser;

  @override
  void initState(){
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try{
      final user = _auth.currentUser;
      if (user != null){
        signedInUser = user;
        print("signedInUser email : $signedInUser\n");
        print(signedInUser.email);
      }
    } catch (e) {
      print("Error signedInUser HomePage: $e");
    }
  }

  @override
  Widget build(BuildContext context) {

    var myHousingArray = [
      {
        "image": "assets/images/hous1.jpg",
        "title": "Duplex",
        "country": "Riyadh",
        "price": 100,
        "housingInfo": "It has 3 bedrooms and 3 bathrooms on two floors"

      },
      {
        "image": "assets/images/hous2.jpg",
        "title": "Villa",
        "country": "Jeddah",
        "price": 200,
        "housingInfo": "It has 3 bedrooms and 3 bathrooms on two floors"

      },
      {
        "image": "assets/images/hous3.jpg",
        "title": "Duplex",
        "country": "AlQassim",
        "price": 300,
        "housingInfo": "It has 3 bedrooms and 3 bathrooms on two floors"

      },
      {
        "image": "assets/images/hous4.jpg",
        "title": "Villa",
        "country": "Dammam",
        "price": 400,
        "housingInfo": "It has 3 bedrooms and 3 bathrooms on two floors"

      },
      {
        "image": "assets/images/hous5.jpg",
        "title": "Duplex",
        "country": "Makkah",
        "price": 500,
        "housingInfo": "It has 3 bedrooms and 3 bathrooms on two floors"

      },
      {
        "image": "assets/images/hous6.jpg",
        "title": "Villa",
        "country": "Riyadh",
        "price": 600,
        "housingInfo": "It has 3 bedrooms and 3 bathrooms on two floors"

      },
    ];
    // It will provise us total height and width of our screen
    Size size = MediaQuery.of(context).size;


    return Container(
      // it enable scrolling on
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // ================ Header With Search Box ===============
            HeaderWithSearchBox(),

            //TitleWithMoreBtn(title: "Categories", press: () {}),

            Categories(),
            // ================ Recomended Titel with btn More ===============
            TitleWithMoreBtn(
              title: "Recomended",
              press: () {},
            ),

            // =============== add list from card as image and text and price ==============
            CardListPlan(myHousingArray: myHousingArray),

            TitleWithMoreBtn(title: "Featured Houses", press: () {}),

            ListViewFeaturedHousesCard(myHousingArray: myHousingArray),
            //Spacer(),
            /*TitleWithMoreBtn(title: "Featured Houses", press: () {}),
            TitleWithMoreBtn(title: "Featured Houses", press: () {}),
            TitleWithMoreBtn(title: "Featured Houses", press: () {}),
            TitleWithMoreBtn(title: "Featured Houses", press: () {}),*/


          ],
        ),
      ),
    );
  }
}

