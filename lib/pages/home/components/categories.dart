import 'package:flutter/material.dart';
import 'package:housing/constants_tools/constants.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //final String categoriesText;
    return Container(
      height: size.height*0.12,
      width: size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(cDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          verticalDirection: VerticalDirection.up,
          children: [
            CategoriesContainer(size,"Villa rental"),
            SizedBox(width: cDefaultPadding),
            CategoriesContainer(size,"Sale land"),
            SizedBox(width: cDefaultPadding),
            CategoriesContainer(size,"Flat sale"),
            SizedBox(width: cDefaultPadding),
            CategoriesContainer(size,"Rental flat"),
            SizedBox(width: cDefaultPadding),
            CategoriesContainer(size,"Villa sale"),
            SizedBox(width: cDefaultPadding),
            CategoriesContainer(size,"farm sales"),


          ],
        ),
      ),
    );
  }

  Container CategoriesContainer(Size size, String categoriesText) {
    return Container(
    //margin: EdgeInsets.symmetric(vertical: size.height * 0.003),
    padding: EdgeInsets.all(cDefaultPadding / 6),
    height: size.width/8,
    width: size.width/3,
    decoration: BoxDecoration(
        color: cBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),

        boxShadow: [
          BoxShadow(
            offset: Offset(0, 15),
            blurRadius: 10,
            color: cPrimaryColor.withOpacity(0.24), //0.50
          ),

          BoxShadow(
            offset: Offset(-15, -15),
            blurRadius: 20,
            color: Colors.white,/*cPrimaryColor.withOpacity(0.28),*/
          ),

        ]),
    child: Align(
      alignment: Alignment.center,
        child: Text(categoriesText, style: TextStyle(color: cPrimaryColor, fontSize: 20),)),
  );
  }
}
