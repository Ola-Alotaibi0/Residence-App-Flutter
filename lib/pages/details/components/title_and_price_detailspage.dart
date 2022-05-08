import 'package:flutter/material.dart';
import 'package:housing/constants_tools/constants.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key? key,
    required this.title,
    required this.country,
    required this.price,
    required this.housingInfo,

  }) : super(key: key);

  final String title;
  final String country;
  final String housingInfo;
  final int price;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: cDefaultPadding),
      child: Row(
        children: [


          // =========== the Text information for Detailse Page
          Container(

            padding: EdgeInsets.all(8.0),
            constraints: BoxConstraints(minWidth: 200, maxWidth: 250),
            //color: Colors.red,

            child: RichText(

              maxLines: 4,
              overflow: TextOverflow.clip,

              text: TextSpan(

                  children: [
                    TextSpan(
                      text: "$title\n",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: cTextColor,
                        fontWeight: FontWeight.bold,
                      ),),

                    TextSpan(
                      text: "$country,".toUpperCase(),
                      style: TextStyle(
                        fontSize: 20,
                        color: cPrimaryColor,
                        fontWeight: FontWeight.w500,

                      ),
                    ),

                    TextSpan(
                      text:"$housingInfo",
                      style: TextStyle(
                        fontSize: 20,
                        color: cPrimaryColor,
                        fontWeight: FontWeight.w300,
                          overflow: TextOverflow.clip,

                      ),
                    ),
                  ]),softWrap: true,),
          ),
          //Containar(),

          /*Container(

            padding: EdgeInsets.all(8.0),
            constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
            child: Text("$housingInfo",
              style: TextStyle(
              fontSize: 20,
              color: cPrimaryColor,
              fontWeight: FontWeight.w300,),
          ),),*/
          Spacer(),

          // =========== the price for Detailse Page
          Text("\$$price", style: Theme.of(context).textTheme.headline5!.copyWith(
            color: cPrimaryColor,

          ),),

        ],
      ),
    );
  }
}
