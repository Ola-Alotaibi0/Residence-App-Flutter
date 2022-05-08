import 'package:flutter/material.dart';
import 'package:housing/constants_tools/constants.dart';
import 'package:housing/pages/details/details_page.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    bool open = false;
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: cDefaultPadding ),
      // it will cover 20% of our total height
      height: size.height * 0.2,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: cDefaultPadding,
              right: cDefaultPadding,
              bottom: 36 + cDefaultPadding,
            ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(color: cPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                )
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    //Padding(padding: EdgeInsets.only(bottom: 10)),
                    Text("Hello to",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                      ),),

                    Text("Residence!",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                //Image.asset("assets/images/logo/logo6.png"),
                Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: new BoxDecoration(

                      color: cBackgroundColor,
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/logo2.jpg"),
                        fit: BoxFit.fill,
                      ),
                      //boxShadow: [BoxShadow(
                      // offset: Offset(10,10),
                      // blurRadius: 50,
                      //color: cBackgroundColor.withOpacity(0.50),)
                      //  ],
                      shape: BoxShape.circle,
                    )
                ),

              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: cDefaultPadding),
                padding: EdgeInsets.symmetric(horizontal: cDefaultPadding),
                height: 54,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                      offset: Offset(0,10),
                      blurRadius: 20,
                      color: cPrimaryColor.withOpacity(0.23),
                    )]
                ),

                child: TextField(
                  /*onChanged: (value){
                    *//*if(open)Navigator.pop(context, DetailsPage());
                    open = false;*//*
                  },*/
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: cPrimaryColor.withOpacity(0.5),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.search,
                      size: 26,
                      color: cPrimaryColor.withOpacity(0.5),),
                  ),
                ),

              ))
        ],
      ),
    );
  }
}