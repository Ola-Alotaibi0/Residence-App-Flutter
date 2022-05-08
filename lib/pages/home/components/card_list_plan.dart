import 'package:flutter/material.dart';
import 'package:housing/constants_tools/constants.dart';
import 'package:housing/pages/details/details_page.dart';

// ============== CardListPlan it is "ListView" have image and Text, Price it's like ""(list card)"" =================
class CardListPlan extends StatelessWidget {
  const CardListPlan({
    Key? key,

    required this.myHousingArray,
  }) : super(key: key);

  final List<Map<String, Object>> myHousingArray;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.36,
      width: size.width,
      color: Colors.transparent,
      padding: EdgeInsets.only(top: cDefaultPadding / 2,),
      child: ListView.builder(
        padding: EdgeInsets.only(right: 20.0),
        scrollDirection: Axis.horizontal,
        itemCount: myHousingArray.length,
        itemBuilder: (BuildContext context, int index) {

          //var press1 = myHousingArray[index]["press"] as Function;
          return CardImageText(
            image: myHousingArray[index]["image"] as String,
            title: myHousingArray[index]["title"] as String,
            country: myHousingArray[index]["country"] as String,
            price: myHousingArray[index]["price"] as int,
            housingInfo: myHousingArray[index]["housingInfo"] as String,


          );},
      ),
    );
  }
}

// ============== CardImageText it's "Containar" have image and text it's like "card"
class CardImageText extends StatelessWidget {
  const CardImageText({
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

    // =============== card big containar image and litter ==============
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
        height: size.width * 0.6,
        width: size.width * 0.4,
        padding: EdgeInsets.only(top: 0.0),
        // margin to put containar in right position on screen
        margin: EdgeInsets.only(
          top: cDefaultPadding / 2,
          left: cDefaultPadding,
          bottom: cDefaultPadding * 2.5,
        ),
        // to put ""bordar"" for basic container
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),

            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0,10),
                blurRadius: 20,
                color: cPrimaryColor.withOpacity(0.23),

              )
            ]
        ),

        child: Column(
          children: [
            // =============== image inside card ==============
            Container(
              padding: EdgeInsets.only(left: 0, right: 0, top: 0,),
              height: size.width * 0.45,
              width: size.width * 0.6,
              margin: EdgeInsets.only(top: 0.0, bottom: cDefaultPadding / 2 ),
              decoration: BoxDecoration(

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                //border: Border.all(width: 4.0),
                //color: Colors.red,
                image: new DecorationImage(
                  image: new AssetImage(image),
                  fit: BoxFit.fill,
                ),

              ),

            ),

            Container(
              margin: EdgeInsets.only(
                left: cDefaultPadding / 2,
                right: cDefaultPadding / 2,
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                          text: country.toUpperCase(),
                          style: TextStyle(
                            color: cPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: Theme.of(context).textTheme.button!.copyWith(
                      color: cPrimaryColor,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}