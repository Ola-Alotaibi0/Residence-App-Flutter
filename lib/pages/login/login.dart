import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:housing/constants_tools/constants.dart';
import 'package:housing/pages/login/background_painter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:housing/pages/login/register_page.dart';
import 'package:housing/pages/login/sign_In_page.dart';
import 'package:animations/animations.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  ValueNotifier<bool> showSignInPage = ValueNotifier<bool>(true);

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: cBackgroundColor,
      body: Stack(
        children: [

          Positioned(
            top: -20,
              left: -100,
              child: Container(
                height: size.height/3,
                width: size.height/3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(500)),
                  color: cBabybluePalette,
                ),
          )),

          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(
                animation: _controller.view,
              ),
            ),
          ),

          Center(
              child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: ValueListenableBuilder<bool>(
                      valueListenable: showSignInPage,
                      builder: (context, value, child) {
                        return PageTransitionSwitcher(
                          reverse: !value,
                          duration: Duration(milliseconds: 900),
                          transitionBuilder: (child, animation, secondaryAnimation){
                            return SharedAxisTransition(
                              animation: animation,
                              secondaryAnimation: secondaryAnimation,
                              transitionType: SharedAxisTransitionType.vertical,
                              fillColor: Colors.transparent,
                              child: child

                            );
                          },
                          child: value
                              ? SignInPage(
                              key: ValueKey("SignIn"),
                              onRegisterClicked: () {
                            showSignInPage.value = false;
                            _controller.forward();
                          }) : Register(
                            key: ValueKey("Register"),
                            onSignInPressed: (){
                              showSignInPage.value = true;
                              _controller.reverse(/*from: 0.5*/);
                            },
                          ),
                        );

                      }))),

        ],
      ),
    );
  }
}
