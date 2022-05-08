import 'package:flutter/material.dart';
import 'package:housing/constants_tools/constants.dart';

class DetailsSmallCard extends StatelessWidget {
  const DetailsSmallCard({
    Key? key,
    required this.details,
    required this.iconName,

  }) : super(key: key);

  final String details;
  final IconData iconName;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        //margin: EdgeInsets.symmetric(vertical: size.height * 0.003),
        padding: EdgeInsets.all(cDefaultPadding / 6),
        height: 60,
        width: 65,
        decoration: BoxDecoration(
            color: cBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),

            boxShadow: [
              BoxShadow(
                offset: Offset(0, 15),
                blurRadius: 20,
                color: cPrimaryColor.withOpacity(0.28), //0.50
              ),

              BoxShadow(
                offset: Offset(-15, -15),
                blurRadius: 20,
                color: Colors.white,/*cPrimaryColor.withOpacity(0.28),*/
              ),

            ]),
        child: Container(
          //color: Colors.amber,
          padding: EdgeInsets.all(0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(iconName, color: cPrimaryColor,),// Icons.call//Icons.share//send_rounded
              Text(details, style: Theme.of(context).textTheme.headline5!.copyWith(
                color: cPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w300,
                //fontWeight: FontWeight.bold,
              ),),
            ],
          ),
        ),
        // ================================================
        /*child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.amber,
              padding: EdgeInsets.all(0.9),
              child: IconButton(
                //padding: EdgeInsets.all(0.2),
                //iconSize: 19,
                icon: Icon(
                  Icons.call,
                  color: cPrimaryColor,
                  size: 20,
                ),
                onPressed: () {},
              ),
            ),
            Container(
              width: cDefaultPadding * 3,
              height: cDefaultPadding * 0.6,
              alignment: Alignment.center,
              color: Colors.green,
              margin: EdgeInsets.only(bottom: 0.0),
              child: Text(details,
                  style: TextStyle(color: cPrimaryColor, fontSize: 18)),
            ),
            *//*RichText(
              //textAlign: TextAlign.center,
              //overflow: TextOverflow.clip,
              //textoverflow: TextOverflow.ellipsis,
              //maxLines: 1,
              //textScaleFactor: 0.6,
              text: TextSpan(
                text: "",
                children: [
                  TextSpan(
                      text: details,
                      style: TextStyle(color: cPrimaryColor, fontSize: 24)),
                ],
                //textWidthBasis: TextWidthBasis.longestLine,
              ),
            ),*//*
          ],
        )*/

      //=======================================



    );
  }
}