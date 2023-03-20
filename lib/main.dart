
import 'package:event_management_app/utils/application_state.dart';
import 'package:event_management_app/utils/custom_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'AdminHomePage/homePage.dart';
import 'Screens/login.dart';
import 'Screens/push.dart';
import 'Screens/setting.dart';
import 'Screens/ticket.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ApplicationState(),

           builder: (context, _) => Consumer<ApplicationState>(

          builder: (context, ApplicationState, _) {
            Widget child;
            switch (ApplicationState.loginState) {
              case ApplicationLoginState.loggetOut:
                child = const LoginScreen();
                break;

              case ApplicationLoginState.loggedIn:
                child = const MyApp();
                break;
              default:
                child = const LoginScreen();
            }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: CustomTheme.getTheme(),
              home: child,
            );
          },
    ),
  ),
          // ChangeNotifierProvider(
          //   create: (BuildContext context) {  },
          //   builder: (context,_)=> EventNotifier(),
          //
          // )
        ],

      ));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    const events(),
    const Ticket(),
    const setting(),
  ];

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(0,0,0,5),
          child: GNav(
              rippleColor: Colors.grey.shade400,
              hoverColor: Colors.grey,
              haptic: true,
              iconSize: 35,
              gap: 8,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              tabActiveBorder: Border.all(color: Colors.black, width: 1),
              tabs: const[
            GButton(
                icon: Icons.home_outlined,
                text: "Home",
            ),
            GButton(
                icon: CupertinoIcons.add_circled,//Icons.add_circle_outlined,
              text: "Create",
            ),
                GButton(
                  icon: CupertinoIcons.tickets,
                  text: "Ticket",
                ),
            GButton(
                icon: CupertinoIcons.person,
              text: "Account",
            )
          ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
          body: MyApp._widgetOptions.elementAt(_selectedIndex),
      ),//const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
