import 'package:flutter/material.dart';
import 'package:housing/constants_tools/constants.dart';
import 'package:housing/pages/home/home_page.dart';
import 'package:housing/pages/login/widget/signin_textfield.dart';
import 'package:housing/pages/login/widget/signin_up_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key, required this.onSignInPressed}) : super(key: key);
  final VoidCallback onSignInPressed;
  @override
  State<Register> createState() => _RegisterState(onSignInPressed);
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;

  final VoidCallback onSignInPressed;
  _RegisterState(this.onSignInPressed);

  @override
  Widget build(BuildContext context) {
    late String email = "null";
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
                  "Create\nAccount",
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
                    colorbordar: cBackgroundColor,
                    colorFocusedBorder: Colors.black,
                  ),
                  SizedBox(height: cDefaultPadding),
                  SignInTextField(
                    onChanged: (value){
                      password = value;
                      //print("password:$value=====>:$password");
                    },
                    inputField: "Password",
                    colorbordar: cBackgroundColor,
                    colorFocusedBorder: Colors.black,
                  ),
                  SizedBox(height: cDefaultPadding*2),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sign up",
                        style: TextStyle(
                            color: cBackgroundColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SinInUpButton(
                        onPressed: () async {
                          email != null
                              ? print("btnE==>$email")
                              : print("please put some Emaile value");
                          password != null
                              ? print("passwordBtn=====>:$password")
                              : print("please put some Emaile value");

                          try {
                            final newUser = await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => HomePage()));
                          } catch (e) {
                            print("Error: $e");
                          }
                        },
                        email: email,
                        password: password,
                        colorButton: cBackgroundColor,
                        colorIconButton: cPrimaryColor,
                      ),
                    ],
                  ),

                  SizedBox(height: cDefaultPadding),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: (){
                        onSignInPressed.call();
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 19,
                          decoration: TextDecoration.underline,
                          color: cBackgroundColor,
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
