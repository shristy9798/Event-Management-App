import 'package:event_management_app/Screens/profile.dart';
import 'package:event_management_app/components/custom_button.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/application_state.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {

  var _loadingButton= false;
  void signOutButtonPressed()
  {
    setState((){
      _loadingButton= true;
    });
    Provider.of<ApplicationState>(context, listen: false).signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            "Settings",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
            child: ListView(children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Account Settings",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          SizedBox(
            width: 200.0,
            height: 80.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(7, 10, 7, 0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return (profile());
                  }));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    primary: Colors.white,
                    padding: EdgeInsets.only(right: 170)),

                icon: const Icon(
                  // <-- Icon
                  Icons.manage_accounts,
                  color: Colors.black,
                  size: 30.0,
                ),
                label: const Text(
                  'Edit Profile',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                // <-- Text
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200.0,
            height: 80.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(7, 10, 7, 0),
              child: ElevatedButton.icon(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    primary: Colors.white,
                    padding: EdgeInsets.only(right: 170)),

                icon: const Icon(
                  // <-- Icon
                  Icons.password,
                  color: Colors.black,
                  size: 30.0,
                ),
                label: const Text(
                  'Edit Password',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                // <-- Text
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Preferences",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200.0,
            height: 80.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(7, 10, 7, 0),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  primary: Colors.white,
                  padding: EdgeInsets.only(right: 170),
                ),

                icon: const Icon(
                  // <-- Icon
                  Icons.notifications,
                  color: Colors.black,
                  size: 30.0,
                ),
                label: const Text(
                  'Notification',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                // <-- Text
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200.0,
            height: 80.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(7, 10, 7, 0),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    primary: Colors.white,
                    padding: const EdgeInsets.only(right: 170)),

                icon: const Icon(
                  // <-- Icon
                  Icons.draw,
                  color: Colors.black,
                  size: 30.0,
                ),
                label: const Text(
                  'Signature',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                // <-- Text
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomButton(text: "Logout", onPress: signOutButtonPressed,loading: _loadingButton,)
          )
        ])));
  }

}
