import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:housing/constants_tools/constants.dart';
import 'package:housing/pages/home/home_page.dart';
import 'package:housing/pages/login/widget/signin_textfield.dart';
import 'package:housing/pages/login/widget/signin_up_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({

    Key? key,
    required this.onRegisterClicked}) : super(key: key);
  final VoidCallback onRegisterClicked;
  @override
  _SignInPageState createState() => _SignInPageState(onRegisterClicked);
  //late AnimationController controllerPage = controller;

}

class _SignInPageState extends State<SignInPage> {
  final VoidCallback onRegisterClicked;
  _SignInPageState(this.onRegisterClicked);

 // _SignInPageState(this.onRegisterClicked);
  //AnimationController controller;

  final _auth = FirebaseAuth.instance;

  //late String email;
  //late String password;

  @override
  Widget build(BuildContext context) {
    String email= "null";
    late String password = "null";
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome\nBack",
                  style: TextStyle(
                      color: cBackgroundColor,
                      fontSize: 44,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView(
                children: [
                  SignInTextField(
                    onChanged: (value){
                      //print("email:$value");
                      email = value;
                      //print("email:$value=====>:$email");

                    },
                    inputField: "Email",
                    colorbordar: cBabybluePalette,
                    colorFocusedBorder: cPrimaryColor,

                  ),
                  SizedBox(height: cDefaultPadding),
                  SignInTextField(
                    onChanged: (value){
                      //print("password:$value");
                      password = value;
                      //print("password:$value=====>:$password");
                    },
                    inputField: "Password",
                    colorbordar: cBabybluePalette,
                    colorFocusedBorder: cPrimaryColor,
                  ),
                  SizedBox(height: cDefaultPadding * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sign in",
                        style: TextStyle(
                            color: cPrimaryColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SinInUpButton(
                        onPressed: (){
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        /*onPressed: () async{
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            if (user != null) {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
                            }
                          } catch (e) {
                            print(e);
                          }
                         *//* email != null ?  Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => HomePage())) : print("please put some Emaile value");
                          password != null ? print("passwordBtn=====>:$password") : print("please put some Emaile value");*//*
                        },*/
                        email: email,
                        password: password,
                        colorButton: cPrimaryColor,
                        colorIconButton: cBackgroundColor,
                         // print("=====>:$password");
                      ),
                    ],
                  ),

                  SizedBox(height: cDefaultPadding),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: (){
                        onRegisterClicked.call();
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 19,
                          decoration: TextDecoration.underline,
                          color: cPrimaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
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




