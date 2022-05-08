import 'package:flutter/material.dart';
import 'package:housing/constants_tools/constants.dart';

class BuyDepositBtn extends StatelessWidget {
  const BuyDepositBtn({
    Key? key,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: size.width / 2,
          height: 84,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),

              ),
            ),
            color: cPrimaryColor,
            onPressed: () {},
            child: Text("Buy Now",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),),
          ),
        ),
        Expanded(
          child: FlatButton(
            onPressed: () {},
            child: Text("Descripation",
              style: TextStyle(color: cTextColor,fontSize: 16,),),
          ),),
      ],
    );
  }
}