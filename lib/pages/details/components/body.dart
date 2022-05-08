import 'dart:io';
import 'package:flutter/material.dart';
import 'package:housing/constants_tools/constants.dart';
//import 'package:housing/pages/components/title_with_more_btn.dart';
import 'package:housing/pages/details/components/buy_deposit_btn.dart';
import 'package:housing/pages/details/components/details_smallicons_card.dart';
import 'package:housing/pages/details/components/image_and_icondetails_card.dart';
import 'package:housing/pages/details/components/title_and_price_detailspage.dart';

class Body extends StatelessWidget {
  const Body(
      {Key? key,
      required this.imageHousing,
      required this.title,
      required this.country,
      required this.price,
      required this.housingInfo})
      : super(key: key);

  final String imageHousing;
  final String title;
  final String country;
  final int price;
  final String housingInfo;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ImageAndIconsCardDetails(image: imageHousing),
            TitleAndPrice(
                title: title,
                country: country,
                price: price,
                housingInfo: housingInfo),

            SizedBox(height: cDefaultPadding,),
            BuyDepositBtn(),
          ],
        ),
      ),
    );
  }
}






