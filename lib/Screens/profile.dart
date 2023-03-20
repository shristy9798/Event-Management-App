import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';


class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String dropdownValue = "Male";
  TextEditingController _name = TextEditingController();
  TextEditingController _mail = TextEditingController();
  TextEditingController _roll = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            "Edit Profile",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 8, right: 8),
          children: [

            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Full Name",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                    //errorText: nameerror,
                    hintText: "Enter your name",
                    labelStyle: const TextStyle(
                        fontSize: 30, color: Color.fromARGB(31, 66, 65, 65)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Email",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: _mail,
                decoration: InputDecoration(
                    //errorText: nameerror,
                    hintText: "Enter your mail",
                    labelStyle: const TextStyle(
                        fontSize: 30, color: Color.fromARGB(31, 66, 65, 65)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "University Roll no.",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: _roll,
                decoration: InputDecoration(
                    //errorText: nameerror,
                    hintText: "Enter your roll no.",
                    labelStyle: const TextStyle(
                        fontSize: 30, color: Color.fromARGB(31, 66, 65, 65)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Gender",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: DropdownButton<String>(
                // Step 3.
                value: dropdownValue,
                // Step 4.
                items: <String>['Male', 'Female', 'Others']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }).toList(),
                // Step 5.
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 101, 224, 246),
                      padding: const EdgeInsets.all(8.0)),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ));
  }
}
