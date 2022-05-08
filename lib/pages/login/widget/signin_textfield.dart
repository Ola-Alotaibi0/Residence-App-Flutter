import 'package:flutter/material.dart';
import 'package:housing/constants_tools/constants.dart';

class SignInTextField extends StatelessWidget {
  const SignInTextField({
    Key? key,
    /*required this.email,
    required this.password,*/
    required this.inputField,
    required this.colorbordar,
    required this.colorFocusedBorder,
    required this.onChanged,
    /*this.email = null,*/

  }) : super(key: key);

  /*final String email;
  final String password;*/
  final String inputField;
  final Color colorbordar;
  final Color colorFocusedBorder;
  final Function onChanged;

  String printText (String emailevalue) {
    print(emailevalue);
    return 'Hello $emailevalue';
  }



  @override
  Widget build(BuildContext context) {
    late String email;
    late String password;
    bool checkPassword () {
      bool checkvalue;
      inputField == "Password" ?
      checkvalue = true : checkvalue = false;
      return checkvalue;
    }

    return TextField(

      keyboardType: TextInputType.emailAddress,
      obscureText: checkPassword(),

      style: TextStyle(color: Colors.black),

      onChanged: (value){onChanged(value);},/*(value){
        inputField == "Email"
            ? email = value
            : password = value;
        inputField == "Email"
            ? printText("email 00 $email")
            : printText("password 00 $password");

      },*/
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        hintText: inputField,
        contentPadding: EdgeInsets.all(10),
        //fillColor: Colors.black,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorbordar.withOpacity(0.6), width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorFocusedBorder, width: 2),
        ),
      ),
    );
     /*String checkInputValueFromUser(){
      return email;
    };*/
  }

  /*TextField TextFieldForEmailPassword() {
    String email;
    return TextField(

    onChanged: (value){
      inputField == "Password" ? printText("email $inputField") : printText("password $value");

    },
    decoration: InputDecoration(
      hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
      hintText: inputField,
      contentPadding: EdgeInsets.all(10),

      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: colorbordar.withOpacity(0.6), width: 2),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: colorFocusedBorder, width: 2),
      ),
    ),
  );
  }*/

}