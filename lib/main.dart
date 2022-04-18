import 'package:flutter/material.dart';
import 'package:untitled2/login/login.dart';
import 'package:untitled2/register/register.dart';
import 'package:untitled2/drawer/pageRoutes.dart';
import 'package:untitled2/webhooks/webhooks.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'controller/enterPasswordController.dart';
import 'controller/otpController.dart';
import 'controller/registerController.dart';
import 'home/dashboard.dart';
import 'home/home.dart';

var sharedPreferences;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((shared) {
    sharedPreferences = shared;
    runApp(MyApp());
  });

}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RegisterController>(create: (_) => RegisterController()),
        ChangeNotifierProvider<OtpController>(create: (_) => OtpController()),
        ChangeNotifierProvider<EnterPasswordController>(create: (_) => EnterPasswordController()),
      ],

      child: MaterialApp(
        title: 'LogicHive',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.orange,
          accentColor: Colors.deepOrange,
          fontFamily: '',
          textTheme:  const TextTheme(

            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),

          )
        ),
        home: MyHomePage(title: 'Aurum',),//MyHomePage(title: 'Flutter Demo Home Page'),
        routes:  {
      pageRoutes.home: (context) => Home(),
      pageRoutes.webhook: (context) => Webhooks(),
      pageRoutes.webhook: (context) => Webhooks(),
      pageRoutes.webhook: (context) => Webhooks(),
      pageRoutes.webhook: (context) => Webhooks(),
      pageRoutes.dashboard: (context) => Dashboard(),
      }, ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var isLogin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin = sharedPreferences.getBool("isLogin");

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: isLogin==true?Dashboard():Login(),

    );
  }
}
