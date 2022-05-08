import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:housing/constants_tools/constants.dart';
import 'package:housing/pages/home/home_page.dart';

class SinInUpButton extends StatelessWidget {
  const SinInUpButton({
    Key? key,
    required this.email,
    required this.password,
    required this.colorButton,
    required this.colorIconButton,
    required this.onPressed,
    //required this.onPressed,
  }) : super(key: key);
  //final VoidCallback onPressed;
  final String email;
  final String password;
  final Color colorButton;
  final Color colorIconButton;
  final Function onPressed;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //FontAwesomeIcons.longArrowAltRight,
      //Icons.double_arrow_rounded,
      onPressed: (){onPressed();},
      /*() {
        print("dddd $email");
        email != null ?
       *//* Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()))*//*print("password:=====>:$password") : print("hi");
      },*/
      child: Icon(FontAwesomeIcons.longArrowAltRight, color: colorIconButton),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        primary: colorButton, // <-- Button color
        onPrimary: cBabybluePalette, // <-- Splash color
      ),
    );
  }
}