import 'package:flutter/material.dart';
import 'package:housing/constants_tools/constants.dart';
import 'package:housing/pages/home/components/body.dart';
import 'package:housing/pages/home/home_page.dart';
import 'package:housing/pages/login/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // we shoud be initializeApp Firebase on main()
  runApp(const MyApp()); // we shoud be initializeApp MyApp() on main()
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Housing',
      theme: ThemeData(
        primaryColor: cPrimaryColor,
        scaffoldBackgroundColor: cBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: cTextColor),
        //primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
     //////////// /*HomePage(),*////////////////////
    );
  }
}
