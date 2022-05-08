import 'package:flutter/material.dart';
import 'package:housing/constants_tools/constants.dart';
import 'package:housing/pages/details/components/details_smallicons_card.dart';

class ImageAndIconsCardDetails extends StatelessWidget {
  const ImageAndIconsCardDetails({
    Key? key,
    required this.image,

  }) : super(key: key);

  final String image;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: cDefaultPadding * 0.4),
      child: SizedBox(
        //height: size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            // =============== Stack it's for image and arrow on Detail housing page
            Stack(
              children: [

                // ======== image inside container on column for details housing ===========
                Container(
                  height: size.height * 0.6,
                  width: size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.center,
                      fit: BoxFit.fill,
                      image: AssetImage("$image"),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 20,
                        color: cPrimaryColor.withOpacity(0.40),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60),
                    ),
                  ),
                ),

                // =========== ( < ) Navigator Back to Page Home =============
                Positioned(
                    left: 5,
                    top: 40,
                    //bottom: 0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    )
                ),
              ],

            ),
            // ================ Small Card For Detail housing page
            Container(
              height: size.height * 0.16,
              //padding: EdgeInsets.only(left: 3, right: 0.9, bottom: 3),
              padding: EdgeInsets.only(top: cDefaultPadding * 2),
              //color: Colors.red,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,//MainAxisAlignment.spaceAround,
                //mainAxisSize = MainAxisSize.max,
                children: [
                  //textAlign: TextAlign.center,
                  DetailsSmallCard(details: "Call", iconName: Icons.call,),// Icons.call//Icons.share//send_rounded
                  DetailsSmallCard(details: "Route",iconName: Icons.room_outlined,),
                  DetailsSmallCard(details: "Share",iconName: Icons.share,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}