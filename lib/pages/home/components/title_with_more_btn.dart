import 'package:flutter/material.dart';
import 'package:housing/constants_tools/constants.dart';
import 'package:housing/pages/details/details_page.dart';


class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key? key,
    required this.title,
    required this.press,

  }) : super(key: key);

  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: cDefaultPadding),
      child: Row(
        children: [
          TitleWithCustomUnderLine(text: title),

          Spacer(),

          FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),),
              color: cPrimaryColor,
              onPressed: () {press;}, //////////////// =================(()((
              child: Text("More",
                style: TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}

class TitleWithCustomUnderLine extends StatelessWidget {
  const TitleWithCustomUnderLine({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: cDefaultPadding / 4),
            child: Text(text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: cDefaultPadding / 4),
              height: 7,
              color: cPrimaryColor.withOpacity(0.2),

            ),
          )
        ],
      ),
    );
  }
}

