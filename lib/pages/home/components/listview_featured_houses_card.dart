import 'package:flutter/material.dart';
import 'package:housing/constants_tools/constants.dart';
import 'package:housing/pages/details/details_page.dart';


class ListViewFeaturedHousesCard extends StatelessWidget {
  const ListViewFeaturedHousesCard({
    Key? key,
    required this.myHousingArray,
  }) : super(key: key);


  final List<Map<String, Object>> myHousingArray;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 1.5,
      width: size.width * 0.9,
      //margin: EdgeInsets.only(top: 20, bottom: 10),
      padding: EdgeInsets.only(
          top: cDefaultPadding / 2, bottom: cDefaultPadding / 2),
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 10.0),
        itemCount: myHousingArray.length,
        itemBuilder: (context, int index){
          return FeaturedHousesCard(
            image: myHousingArray[index]["image"] as String,
            title: myHousingArray[index]["title"] as String,
            country: myHousingArray[index]["country"] as String,
            price: myHousingArray[index]["price"] as int,
            housingInfo: myHousingArray[index]["housingInfo"] as String,
          );
        },
      ),
    );
  }
}

class FeaturedHousesCard extends StatelessWidget {
  const FeaturedHousesCard({
    Key? key,
    required this.image,
    required this.title,
    required this.country,
    required this.price,
    required this.housingInfo,


  }) : super(key: key);
  final String image;
  final String title;
  final String country;
  final int price;
  final String housingInfo;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(
                  imageHousing: image,
                  title: title,
                  country: country,
                  price: price,
                  housingInfo: housingInfo),
            ));
      },
      child: Container(
        height: size.width * 0.47,
        width: size.width * 0.8,
        padding: EdgeInsets.only(top: 0.0),
        // margin to put containar in right position on screen
        margin: EdgeInsets.only(
          top: cDefaultPadding / 2,
          left: cDefaultPadding * 0.2,
          bottom: cDefaultPadding,// * 1.5,
        ),
        // to put ""bordar"" for basic container
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(40),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(40),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 20,
                color: cPrimaryColor.withOpacity(0.23),
              )
            ]),
        child: Row(
          children: [
            // ================= title and price as column
            Container(
              margin: EdgeInsets.only(
                left: cDefaultPadding / 2,
                right: cDefaultPadding / 6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [

                  Text(
                    "$title".toUpperCase(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      //height: 7.0,
                      //letterSpacing: 1.0,
                    ),
                    //style: Theme.of(context).textTheme.button,
                  ),
                  Container(
                    //height: size.height / 4,
                    width: size.width * 0.3,
                    //color: Colors.red,
                    child: Text("$country",
                      style: TextStyle(
                        color: cPrimaryColor.withOpacity(0.5),
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  //Spacer(flex: 9,),
                  Text(
                    '\$$price',
                    style: Theme.of(context).textTheme.button!.copyWith(
                      color: cPrimaryColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            // =============== image inside card ==============
            Container(
              padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0, bottom: 0),
              height: size.width * 0.80,
              width: size.width * 0.55,
              margin: EdgeInsets.only(top: 0.0, bottom: 0, left:0.0),
              decoration: BoxDecoration(

                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                //border: Border.all(width: 4.0),
                //color: Colors.red,
                image: new DecorationImage(
                  image: new AssetImage("$image"),
                  fit: BoxFit.fill,
                ),

              ),

            ),
          ],
        ),
      ),
    );
  }
}